import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class ShopTrendingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(Constants.LayoutPadding),
              top: ScreenUtil().setWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Trending",
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
        SizedBox(
          height: ScreenUtil().setHeight(60),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
              bottom: ScreenUtil().setWidth(30)),
          child: Text(
            "no data available.",
            style: valueTextStyle,
          ),
        )
      ],
    );
  }
}
