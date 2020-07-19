import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Donate for #NichaCGM48",
          style: appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(Constants.LayoutPadding),
            top: ScreenUtil().setWidth(Constants.LayoutPadding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setSp(10)),
              child: Text(
                "coming soon.", // "3 physical card available."
                style: valueTextStyle,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
          ],
        ),
      ),
    );
  }
}