import 'package:flutter/material.dart';
import 'package:nichacgm48/common/app_constant.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';

class PhotosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: globalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "PHOTOS",
                style: titleHeadingContentTextStyle,
              ),
              Text(
                "VIEW ALL",
                style: viewAllTextStyle,
              )
            ],
          ),
        ),
        SizedBox(
          height: ScaleSize.safeBlockHorizontal * 2,
        ),
        Padding(
          padding: globalPaddingLeftOnly,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset("assets/images/nicha_1.jpg",
                        height: ScaleSize.blockSizeVertical * 22, width: ScaleSize.blockSizeHorizontal * 35, fit: BoxFit.cover),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset("assets/images/nicha_2.jpg",
                        height: ScaleSize.blockSizeVertical * 22, width: ScaleSize.blockSizeHorizontal * 35, fit: BoxFit.cover),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset("assets/images/nicha_3.jpg",
                        height: ScaleSize.blockSizeVertical * 22, width: ScaleSize.blockSizeHorizontal * 35, fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
