import 'package:flutter/material.dart';
import 'package:nichacgm48/common/social_media_widget.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowNichaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const paddingWidth = 8.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: paddingWidth),
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
                          await launch(protocolUrl, forceSafariVC: false);
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: paddingWidth),
                      child: SocialMediaWidget(
                        imagePath: "assets/icons/instagram_icon.png",
                        name: "NICHACGM48",
                      )),
                  onTap: () async {
                    const protocolUrl = 'ig://page/cgm48official.nicha';
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
