import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/ui/widgets/social_medias_widget.dart';
import 'package:nichacgm48/ui/widgets/hashtags_widget.dart';
import 'package:nichacgm48/ui/widgets/personal_information_widget.dart';
import 'package:nichacgm48/ui/widgets/photos_widget.dart';
import 'package:nichacgm48/ui/widgets/supporters_widget.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(globalPadding)),
          child: Column(
            children: <Widget>[
              SocialMediasWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              PersonalInformationWidget(),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(70),
        ),
        PhotosWidget(),
        SizedBox(
          height: ScreenUtil().setHeight(70),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(globalPadding)),
          child: HashTagsWidget(),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(70),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(globalPadding)),
          child: SupportersWidget(),
        )
      ],
    );
  }
}
