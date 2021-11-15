import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/instagram_posts_bloc.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/models/instagram_post_model.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/instagram_post_widget.dart';
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
              horizontal: ScreenUtil().setWidth(Constants.LayoutPadding)),
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
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(Constants.LayoutPadding)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StreamBuilder(
              stream: instagramPostsBLoc.posts,
              builder:
                  (context, AsyncSnapshot<EdgeOwnerToTimelineMedia> snapshot) {
                if (snapshot.hasData) {
                  return InstagramPostWidget(posts: snapshot.data);
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
