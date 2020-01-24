import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nichacgm48/common/app_constant.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/components/full_creen_image.dart';
import 'package:nichacgm48/models/instagram_post.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PhotosWidget extends StatelessWidget {
  final EdgeOwnerToTimelineMedia posts = null;

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
              InkWell(
                  child: Text(
                    "VIEW ALL",
                    style: viewAllTextStyle,
                  ),
                  onTap: () async {
                    const protocolUrl = 'ig://page/nicha.cgm48official';
                    const fallbackUrl =
                        'https://www.instagram.com/nicha.cgm48official';

                    try {
                      bool launched =
                          await launch(protocolUrl, forceSafariVC: false);
                      if (!launched) {
                        await launch(fallbackUrl, forceSafariVC: false);
                      }
                    } catch (e) {
                      await launch(fallbackUrl, forceSafariVC: false);
                    }
                  },
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
            child: FutureBuilder<EdgeOwnerToTimelineMedia>(
              future:
                  fetchPosts("https://www.instagram.com/nicha.cgm48official/"),
              builder: (context, result) {
                if (result.hasError) print(result.error);
                return result.hasData
                    ? InstagramPosts(posts: result.data)
                    : Padding(
                        padding: const EdgeInsets.only(
                            top: 70, bottom: 70, right: 5, left: 5),
                        child: SizedBox(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.amber,
                          ),
                          width: ScaleSize.safeBlockHorizontal * 5,
                          height: ScaleSize.safeBlockHorizontal * 5,
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<EdgeOwnerToTimelineMedia> fetchPosts(String url) async {
    final response =
        await http.get('https://www.instagram.com/nicha.cgm48official/?__a=1');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var responseJson = json.decode(response.body);

      var timeline = EdgeOwnerToTimelineMedia.fromJson(
          responseJson['graphql']['user']['edge_owner_to_timeline_media']);

      //print('count: ${timeline.count}');
      //print('info: ${timeline.pageInfo.toJson()}');
      //print('posts: ${timeline.edges.length}');

      return timeline;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

class InstagramPosts extends StatelessWidget {
  final EdgeOwnerToTimelineMedia posts;

  InstagramPosts({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: posts.edges
            .asMap()
            .map((i, post) => MapEntry(
                i,
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        _navigationToFullScreenImage(context, i);
                      },
                      child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                                height: ScaleSize.blockSizeVertical * 22,
                                width: ScaleSize.blockSizeHorizontal * 35,
                                color: Colors.black12,
                              ),
                          imageUrl: post.node.thumbnailSrc,
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
          fontSize: ScaleSize.blockSizeHorizontal * 3.5,
        ),
      ),
    );
  }
}
