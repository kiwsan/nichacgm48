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
          "Nicha CGM48",
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
            Text(
              "DONATE",
              style: nickNameTextStyle,
            ),
            Text(
              "3 physical card",
              style: normalTextStyle,
            ),
            /*Material(
              elevation: 4,
              borderRadius:
                  BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15))),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      ":)",
                      style: donateTitleTextStyle,
                    ),
                    Text(
                      "VISA",
                      style: donateTitleTextStyle,
                    ),
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
