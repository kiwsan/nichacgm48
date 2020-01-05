import 'package:flutter/material.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/components/toolbar_widget.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';

class HeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ToolBarWidget(),
        SizedBox(
          height: ScaleSize.safeBlockHorizontal * 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "YOU'RE WELCOME",
              style: welcomeTextStyle,
            ),
            Text(
              "NICHA",
              style: nickNameTextStyle,
            ),
            Text(
              "NICHAREE SUNGKHATHAT NA AYUDHYA",
              style: fullNameEnTextStyle,
            ),
            Text(
              "ณิชารีย์ สังขทัต ณ อยุธยา",
              style: fullNameThTextStyle,
            )
          ],
        )
      ],
    );
  }
}
