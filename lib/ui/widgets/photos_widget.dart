import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/instagram_posts_bloc.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/ui/widgets/full_creen_image.dart';
import 'package:nichacgm48/models/instagram_post_model.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/progressbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotosWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    instagramPostsBLoc.fetchPosts();

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(globalPadding)),
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
          height: ScreenUtil().setHeight(20),
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(globalPadding)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StreamBuilder(
              stream: instagramPostsBLoc.posts,
              builder:
                  (context, AsyncSnapshot<EdgeOwnerToTimelineMedia> snapshot) {
                if (snapshot.hasData) {
                  return _InstagramPosts(posts: snapshot.data);
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                    style: errorTextStyle,
                  );
                }

                return ProgressBar(size: 215,);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _InstagramPosts extends StatelessWidget {
  final EdgeOwnerToTimelineMedia posts;

  _InstagramPosts({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: posts.edges
            .asMap()
            .map((i, post) => MapEntry(
                i,
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(20)),
                  child: Padding(
                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                    child: GestureDetector(
                      onTap: () {
                        _navigationToFullScreenImage(context, i);
                      },
                      child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                                width: ScreenUtil().setWidth(380),
                                height: ScreenUtil().setHeight(425),
                                color: Colors.black12,
                              ),
                          imageUrl: post.node.thumbnailSrc,
                          width: ScreenUtil().setWidth(380),
                          height: ScreenUtil().setHeight(425),
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
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
          fontSize: ScreenUtil().setSp(35),
        ),
      ),
    );
  }
}