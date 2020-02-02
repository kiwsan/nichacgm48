import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class SocialMediaWidget extends StatelessWidget {
  final String name;
  final String imagePath;

  const SocialMediaWidget({Key key, this.name = "", @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  imagePath,
                  width: ScreenUtil().setWidth(75),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
            child: Text(
              name,
              style: socialMediaTextStyle,
            ),
          ),
        ]);
  }
}
