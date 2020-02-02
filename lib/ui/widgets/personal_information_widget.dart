import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/ui/widgets/card_text_widget.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class PersonalInformationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "PERSONAL INFORMATION",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(30),
        ),
        Material(
          elevation: 4,
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15))),
          child: Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(40),
                top: ScreenUtil().setWidth(30),
                bottom: ScreenUtil().setWidth(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CardTextWidget(
                  title: "HEIGHT: ",
                  value: "163",
                ),
                CardTextWidget(
                  title: "LIKE: ",
                  value: "สีเหลือง, กะเพรา(กุ้ง+ปลาหมึก)",
                ),
                CardTextWidget(
                  title: "BLOOD GROUP: ",
                  value: "O",
                ),
                CardTextWidget(
                  title: "PRIVINCE: ",
                  value: "เชียงราย",
                ),
                CardTextWidget(
                  title: "HOBBY: ",
                  value: "ถ่ายภาพ, อ่านหนังสือ, ดูหนัง, การ์ตูน, ซีรี่ย์",
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
