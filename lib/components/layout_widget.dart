import 'package:flutter/material.dart';
import 'package:nichacgm48/common/app_constant.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/components/follow_nacha_widget.dart';
import 'package:nichacgm48/components/hashtags_widget.dart';
import 'package:nichacgm48/components/personal_information_widget.dart';
import 'package:nichacgm48/components/photos_widget.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: globalPadding,
          child: Column(
            children: <Widget>[
              FollowNichaWidget(),
              SizedBox(
                height: ScaleSize.safeBlockVertical * 1,
              ),
              PersonalInformationWidget(),
            ],
          ),
        ),
        PhotosWidget(),
        SizedBox(
          height: ScaleSize.safeBlockVertical * 2.5,
        ),
        Padding(
          padding: globalPadding,
          child: HashTagsWidget(),
        ),
      ],
    );
  }
}
