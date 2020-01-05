import 'package:flutter/material.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "2020 © design and develop by alpha. All rights reserved",
          style: copyRightTextStyle,
        ),
        SizedBox(
          height: ScaleSize.safeBlockHorizontal * 1,
        )
      ],
    );
  }
}
