import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/ui/widgets/rounded_image_widget.dart';
import 'package:nichacgm48/utils/scale_size.dart';
import 'package:nichacgm48/styles/text_styles.dart';
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
          height: ScreenUtil().setHeight(5),
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
                        //await launch(protocolUrl, forceSafariVC: false);
                        await launch(fallbackUrl, forceSafariVC: false);
                    if (!launched) {
                      await launch(fallbackUrl, forceSafariVC: false);
                    }
                  } catch (e) {
                    await launch(fallbackUrl, forceSafariVC: false);
                  }
                },
                child: RoundedImageWidget(
                  image: "assets/images/nicha_home_fan_page.jpg",
                  socialImage: "assets/icons/facebook_icon.png",
                ))
          ],
        ),
      ],
    );
  }
}
