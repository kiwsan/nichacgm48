import 'package:flutter/material.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "SUPPORTERS",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScaleSize.safeBlockHorizontal * 2,
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () async {
                const protocolUrl = 'fb://page/nichacgm48thfans';
                const fallbackUrl =
                    'https://www.facebook.com/nichacgm48thfans';

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  "assets/images/nicha_home_fan_page.jpg",
                  width: ScaleSize.safeBlockHorizontal * 20,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
