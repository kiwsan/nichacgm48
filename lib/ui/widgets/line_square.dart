import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class LineSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "LINE SQUARE",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Row(
          children: <Widget>[
            InkWell(
                onTap: () async {
                  const protocolUrl = 'fb://page/nichacgm48thfans';
                  const fallbackUrl =
                      'https://line.me/ti/g2/iN_IcvBYB8RQ-_96gEoSmg?utm_source=invitation&utm_medium=link_copy&utm_campaign=default';

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
                child: Image.asset(
                  "assets/icons/line_social_circle.png",
                  width: ScreenUtil().setWidth(150),
                ))
          ],
        ),
      ],
    );
  }
}
