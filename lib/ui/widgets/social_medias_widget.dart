import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/ui/widgets/social_media_widget.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setHeight(20)),
                      child: SocialMediaWidget(
                        imagePath: "assets/icons/facebook_icon.png",
                        name: "NICHACGM48",
                      )),
                  onTap: () async {
                    const protocolUrl = 'fb://page/cgm48official.nicha';
                    const fallbackUrl =
                        'https://www.facebook.com/cgm48official.nicha';

                    try {
                      bool launched =
                          //await launch(protocolUrl, forceSafariVC: false);
                          await launch(fallbackUrl, forceSafariVC: false);
                      if (!launched) {
                        await launch(fallbackUrl, forceSafariVC: false);
                      }
                    } catch (e) {
                      await launch(fallbackUrl, forceSafariVC: false);
                    }
                  },
                ),
                InkWell(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setHeight(20)),
                      child: SocialMediaWidget(
                        imagePath: "assets/icons/instagram_icon.png",
                        name: "NICHACGM48",
                      )),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "DATE OF BIRTH",
                style: titleTextStyle,
              ),
              Text(
                "2004-08-26",
                style: valueTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
