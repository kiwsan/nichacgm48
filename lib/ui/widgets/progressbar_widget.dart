import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final double size;

  ProgressBar({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(size),
          bottom: ScreenUtil().setWidth(size),
          right: ScreenUtil().setWidth(10),
          left: ScreenUtil().setWidth(10)),
      child: SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: Colors.amber,
          strokeWidth: ScreenUtil().setWidth(5),
        ),
      ),
    );
  }
}
