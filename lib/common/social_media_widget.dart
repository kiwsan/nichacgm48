import 'package:flutter/material.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';

class SocialMediaWidget extends StatelessWidget {
  final String name;
  final String imagePath;

  const SocialMediaWidget({Key key, this.name = "", @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  imagePath,
                  width: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              name,
              style: socialMediaTextStyle,
            ),
          ),
        ]);
  }
}
