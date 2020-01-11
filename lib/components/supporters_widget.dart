import 'package:flutter/material.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';

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
            Image.asset(
              "assets/images/nicha_home_fan_page.jpg",
              width: ScaleSize.safeBlockHorizontal * 20,
            )
          ],
        ),
      ],
    );
  }
}
