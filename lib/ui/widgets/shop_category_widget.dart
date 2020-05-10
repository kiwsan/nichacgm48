import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class ShopCategoryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Categories",
                style: titleHeadingContentTextStyle,
              ),
              InkWell(
                child: Text(
                  "VIEW ALL",
                  style: viewAllTextStyle,
                ),
                onTap: () async {},
              )
            ],
          ),
        ),
      ],
    );
  }

}
