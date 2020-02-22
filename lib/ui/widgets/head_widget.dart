import 'package:flutter/material.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class HeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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