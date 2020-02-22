import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedImageWidget extends StatelessWidget {
  final String image;
  final String socialImage;

  const RoundedImageWidget({Key key, @required this.image, this.socialImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(
              width: ScreenUtil().setWidth(210),
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: ScreenUtil().setWidth(2),
            bottom: ScreenUtil().setWidth(10),
            child: ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(60),
                child: Center(
                  child: socialImage != null
                      ? Image.asset(socialImage)
                      : Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedImageNetworkWidget extends StatelessWidget {
  final String image;
  final String socialImage;

  const RoundedImageNetworkWidget(
      {Key key, @required this.image, this.socialImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(
              width: ScreenUtil().setWidth(210),
              child: ClipOval(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: ScreenUtil().setWidth(2),
            bottom: ScreenUtil().setWidth(10),
            child: ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(60),
                child: Center(
                  child: socialImage != null
                      ? Image.network(socialImage)
                      : Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
