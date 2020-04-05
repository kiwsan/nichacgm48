import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/appbar_widget.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(Constants.LayoutPadding),
            top: ScreenUtil().setWidth(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "PROJECTS",
              style: nickNameTextStyle,
            ),
            Text(
              "All about Nicha",
              style: normalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
