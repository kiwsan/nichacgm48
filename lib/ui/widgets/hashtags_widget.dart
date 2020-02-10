import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/ui/widgets/card_text_widget.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class HashTagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "HASHTAGS",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil().setWidth(15))),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(20),
                        top: ScreenUtil().setWidth(5),
                        bottom: ScreenUtil().setWidth(5)),
                    child: InkWell(
                        child: CardTextWidget(
                          title: "#NICHACGM48",
                          value: "",
                        ),
                        onTap: () async {
                          const protocolUrl =
                              'twitter://hashtag/NICHACGM48?src=hashtag_click&f=live';
                          const fallbackUrl =
                              'https://twitter.com/hashtag/NICHACGM48?src=hashtag_click&f=live';

                          try {
                            bool launched =
                                await launch(protocolUrl, forceSafariVC: false);
                            if (!launched) {
                              await launch(fallbackUrl, forceSafariVC: false);
                            }
                          } catch (e) {
                            await launch(fallbackUrl, forceSafariVC: false);
                          }
                        })),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenUtil().setWidth(15))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                      right: ScreenUtil().setWidth(20),
                      top: ScreenUtil().setWidth(5),
                      bottom: ScreenUtil().setWidth(5)),
                  child: InkWell(
                      child: CardTextWidget(
                        title: "#CGM48",
                        value: "",
                      ),
                      onTap: () async {
                        const protocolUrl =
                            'twitter://hashtag/CGM48?src=hashtag_click&f=live';
                        const fallbackUrl =
                            'https://twitter.com/hashtag/CGM48?src=hashtag_click&f=live';

                        try {
                          bool launched =
                              await launch(protocolUrl, forceSafariVC: false);
                          if (!launched) {
                            await launch(fallbackUrl, forceSafariVC: false);
                          }
                        } catch (e) {
                          await launch(fallbackUrl, forceSafariVC: false);
                        }
                      }),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
