import 'package:flutter/material.dart';
import 'package:nichacgm48/utils/scale_size.dart';

class RoundedImageWidget extends StatelessWidget {
  final String image;
  final String socialImage;

  const RoundedImageWidget(
      {Key key, @required this.image, @required this.socialImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(
              width: ScaleSize.safeBlockHorizontal * 20,
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 2,
            bottom: 5,
            child: ClipOval(
              child: Container(
                width: ScaleSize.safeBlockHorizontal * 5,
                child: Center(
                  child: Image.asset(socialImage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
