import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/utils/scale_size.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var yearNow = new DateTime.now().year;

    return Column(
      children: <Widget>[
        Text(
          "$yearNow © design and develop by alpha. All rights reserved",
          style: copyRightTextStyle,
        ),
        SizedBox(
          height: ScreenUtil().setHeight(1),
        )
      ],
    );
  }
}
