import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class ShopCategoryWidget extends StatelessWidget {
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
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(30)),
          child: Row(
            children: <Widget>[
              Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  height: ScreenUtil().setHeight(300),
                  width: ScreenUtil().setWidth(350),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/no-data-avaliable.png",
                        width: ScreenUtil().setWidth(100),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  height: ScreenUtil().setHeight(300),
                  width: ScreenUtil().setWidth(350),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/no-data-avaliable.png",
                        width: ScreenUtil().setWidth(100),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Container(
                  height: ScreenUtil().setHeight(300),
                  width: ScreenUtil().setWidth(350),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/no-data-avaliable.png",
                        width: ScreenUtil().setWidth(100),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
