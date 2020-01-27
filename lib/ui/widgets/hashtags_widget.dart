import 'package:flutter/material.dart';
import 'package:nichacgm48/ui/widgets/card_text_widget.dart';
import 'package:nichacgm48/utils/scale_size.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class HashTagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "HASHTAGS",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScaleSize.safeBlockHorizontal * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Material(
                elevation: 4,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                    child: InkWell(
                        child: CardTextWidget(
                          title: "#NICHACGM48",
                          value: "",
                        ),
                        onTap: () async {
                          const protocolUrl = 'twitter://hashtag/NICHACGM48?src=hashtag_click&f=live';
                          const fallbackUrl =
                              'https://twitter.com/hashtag/NICHACGM48?src=hashtag_click&f=live';

                          try {
                            bool launched =
                                await launch(protocolUrl, forceSafariVC: false);
                            if (!launched) {
                              await launch(fallbackUrl, forceSafariVC: false);
                            }
                          } catch (e) {
                            await launch(fallbackUrl, forceSafariVC: false);
                          }
                        })),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Material(
                elevation: 4,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                  child: InkWell(
                      child: CardTextWidget(
                        title: "#CGM48",
                        value: "",
                      ),
                      onTap: () async {
                        const protocolUrl = 'twitter://hashtag/CGM48?src=hashtag_click&f=live';
                        const fallbackUrl =
                            'https://twitter.com/hashtag/CGM48?src=hashtag_click&f=live';

                        try {
                          bool launched =
                              await launch(protocolUrl, forceSafariVC: false);
                          if (!launched) {
                            await launch(fallbackUrl, forceSafariVC: false);
                          }
                        } catch (e) {
                          await launch(fallbackUrl, forceSafariVC: false);
                        }
                      }),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
