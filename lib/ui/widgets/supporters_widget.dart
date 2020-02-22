import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/supporter_bloc.dart';
import 'package:nichacgm48/models/supporter_model.dart';
import 'package:nichacgm48/ui/widgets/progressbar_widget.dart';
import 'package:nichacgm48/ui/widgets/rounded_image_widget.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    supporterBloc.fetchSupporters();

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "SUPPORTERS",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Row(
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                child: StreamBuilder(
                    stream: supporterBloc.supporters,
                    builder: (context, AsyncSnapshot<Supporters> snapshot) {
                      if (snapshot.hasData) {
                        return _Supporters(supporters: snapshot.data);
                      } else if (snapshot.hasError) {
                        return Text(
                          snapshot.error.toString(),
                          style: errorTextStyle,
                        );
                      }

                      return ProgressBar(
                        size: 0,
                      );
                    })),
          ],
        ),
      ],
    );
  }
}

class _Supporters extends StatelessWidget {
  final Supporters supporters;

  _Supporters({Key key, @required this.supporters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: supporters.supporters
            .asMap()
            .map((key, value) => MapEntry(
                key,
                InkWell(
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
                    ))))
            .values
            .toList());
  }
}
