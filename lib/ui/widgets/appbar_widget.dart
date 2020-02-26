import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';

AppBar defaultAppBar = AppBar(
    title: Text(
      "Nicha CGM48",
      style: appBarTitleTextStyle,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.notifications,
          size: ScreenUtil().setWidth(90),
          color: Colors.black54,
        ),
        onPressed: () {},
      )
    ],
    leading: Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(globalPadding),
          bottom: ScreenUtil().setWidth(20),
          top: ScreenUtil().setWidth(20)),
      child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg')),
    ));
