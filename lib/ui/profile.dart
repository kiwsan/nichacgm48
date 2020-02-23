import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/footer_widget.dart';
import 'package:nichacgm48/ui/widgets/layout_widget.dart';
import 'package:nichacgm48/utils/fade_animation.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset:
              Offset(ScreenUtil().setWidth(590), ScreenUtil().setHeight(-650)),
          child: Transform.rotate(
            angle: -4.1,
            child: SvgPicture.asset(
              'assets/icons/ellipse_top_left.svg',
              width: ScreenUtil().setWidth(1250),
            ),
          ),
        ),
        Transform.translate(
          offset:
              Offset(ScreenUtil().setHeight(-250), ScreenUtil().setHeight(900)),
          child: Transform.rotate(
            angle: -0.5,
            child: SvgPicture.asset(
              'assets/icons/ellipse_middle_right.svg',
              width: ScreenUtil().setWidth(250),
              height: ScreenUtil().setHeight(300),
            ),
          ),
        ),
        Transform.translate(
          offset:
              Offset(ScreenUtil().setWidth(995), ScreenUtil().setHeight(1700)),
          child: Transform.rotate(
            angle: -1.5,
            child: SvgPicture.asset('assets/icons/ellipse_center_buttom.svg',
                width: ScreenUtil().setWidth(220)),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(globalPadding)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FadeAnimation(
                              1,
                              Image.asset(
                                "assets/images/h_nicha.png",
                                width: ScreenUtil().setWidth(695),
                                height: ScreenUtil().setHeight(1020),
                              ))
                        ]),
                    Column(
                      children: <Widget>[
                        Text(
                          "CGM48",
                          style: bandNameTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              LayoutWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(globalPadding)),
                child: FooterWidget(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
