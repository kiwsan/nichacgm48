import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insta_html_parser/insta_html_parser.dart';
import 'package:nichacgm48/common/app_constant.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/components/full_creen_image.dart';
import 'package:nichacgm48/models/instagram_post.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotosWidget extends StatelessWidget {
  final List<InstagramPost> posts = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: globalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "PHOTOS",
                style: titleHeadingContentTextStyle,
              ),
              Text(
                "VIEW ALL",
                style: viewAllTextStyle,
              )
            ],
          ),
        ),
        SizedBox(
          height: ScaleSize.safeBlockHorizontal * 2,
        ),
        Padding(
          padding: globalPaddingLeftOnly,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder<List<InstagramPost>>(
              future:
                  getPosts("https://www.instagram.com/nicha.cgm48official/"),
              builder: (context, result) {
                if (result.hasError) print(result.error);
                return result.hasData
                    ? InstagramPosts(posts: result.data)
                    : Padding(
                        padding: const EdgeInsets.only(
                            top: 70, bottom: 70, right: 5, left: 5),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.amber,
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<List<InstagramPost>> getPosts(String url) async {
    await InstaParser.postsUrlsFromProfile(
            "https://www.instagram.com/nicha.cgm48official/")
        .then((List<String> postsUrls) async {
      for (int i = 0; i < postsUrls.length; i++) {
        var post = InstagramPost(
            photoLargeUrl: postsUrls[i] + '/media/?size=l',
            photoMediumUrl: postsUrls[i] + '/media/?size=m',
            photoSmallUrl: postsUrls[i] + '/media/?size=t');

        posts.add(post);
      }
    });

    return posts;
  }
}

class InstagramPosts extends StatelessWidget {
  final List<InstagramPost> posts;

  InstagramPosts({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: posts
            .asMap()
            .map((i, item) => MapEntry(
                i,
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        _navigationToFullScreenImage(context, i);
                      },
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: item.photoMediumUrl,
                          height: ScaleSize.blockSizeVertical * 22,
                          width: ScaleSize.blockSizeHorizontal * 35,
                          fit: BoxFit.cover),
                    ),
                  ),
                )))
            .values
            .toList());
  }

  void _navigationToFullScreenImage(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(
          posts: posts,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
