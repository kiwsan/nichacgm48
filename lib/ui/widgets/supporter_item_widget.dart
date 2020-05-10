import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/models/supporter_model.dart';
import 'package:nichacgm48/ui/widgets/rounded_image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SupporterItemWidget extends StatelessWidget {
  final Supporters supporters;

  SupporterItemWidget({Key key, @required this.supporters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: supporters.supporters
            .asMap()
            .map((key, value) => MapEntry(
                key,
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                  child: InkWell(
                      onTap: () async {
                        //const protocolUrl = 'fb://page/nichacgm48thfans';
                        var fallbackUrl = value.url;

                        try {
                          bool launched =
                              //await launch(protocolUrl, forceSafariVC: false);
                              await launch(fallbackUrl, forceSafariVC: false);
                          if (!launched) {
                            await launch(fallbackUrl, forceSafariVC: false);
                          }
                        } catch (e) {
                          await launch(fallbackUrl, forceSafariVC: false);
                        }
                      },
                      child: RoundedImageNetworkWidget(
                        image: value.image,
                        socialImage: value.social,
                        size: 150,
                      )),
                )))
            .values
            .toList());
  }
}
