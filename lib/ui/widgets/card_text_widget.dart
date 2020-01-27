import 'package:flutter/material.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class CardTextWidget extends StatelessWidget {
  final String title;
  final String value;

  const CardTextWidget({Key key, this.title = "", this.value = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: Text(
            value,
            style: valueTextStyle,
          ),
        ),
      ],
    );
  }
}
