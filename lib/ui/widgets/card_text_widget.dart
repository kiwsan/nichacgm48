import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class CardTextWidget extends StatelessWidget {
  final String title;
  final String value;

  const CardTextWidget({Key key, this.title = "", this.value = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(10),
              bottom: ScreenUtil().setWidth(10)),
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(10),
              bottom: ScreenUtil().setWidth(10)),
          child: Text(
            value,
            style: valueTextStyle,
          ),
        ),
      ],
    );
  }
}
