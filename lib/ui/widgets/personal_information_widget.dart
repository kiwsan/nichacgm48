import 'package:flutter/material.dart';
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
        Padding(
          padding:
              const EdgeInsets.only(left: 2, right: 2, bottom: 16, top: 10),
          child: Material(
            elevation: 4,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
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
          ),
        )
      ],
    );
  }
}
