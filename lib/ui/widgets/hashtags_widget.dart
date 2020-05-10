import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/hashtag_bloc.dart';
import 'package:nichacgm48/models/hashtag_model.dart';
import 'package:nichacgm48/ui/widgets/card_text_widget.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/progressbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HashTagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    hastagBloc.fetchHashtags();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "HASHTAGS",
              style: titleHeadingContentTextStyle,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
            child: StreamBuilder(
                stream: hastagBloc.hastags,
                builder: (context, AsyncSnapshot<HashTags> snapshot) {
                  if (snapshot.hasData) {
                    return _HashTags(hashTags: snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text(
                      snapshot.error.toString(),
                      style: errorTextStyle,
                    );
                  }

                  return ProgressBar(
                    size: 0,
                  );
                }))
      ],
    );
  }
}

class _HashTags extends StatelessWidget {
  final HashTags hashTags;

  _HashTags({Key key, @required this.hashTags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: hashTags.hashtags
          .asMap()
          .map((i, hashTag) => MapEntry(
              i,
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(15))),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20),
                            right: ScreenUtil().setWidth(20),
                            top: ScreenUtil().setWidth(5),
                            bottom: ScreenUtil().setWidth(5)),
                        child: InkWell(
                            child: CardTextWidget(
                              title: hashTag.title,
                              value: "",
                            ),
                            onTap: () async {
                              var protocolUrl =
                                  'twitter://hashtag/${hashTag.hashtag}?src=hashtag_click&f=live';
                              var fallbackUrl =
                                  'https://twitter.com/hashtag/${hashTag.hashtag}?src=hashtag_click&f=live';

                              try {
                                bool launched = await launch(protocolUrl,
                                    forceSafariVC: false);
                                if (!launched) {
                                  await launch(fallbackUrl,
                                      forceSafariVC: false);
                                }
                              } catch (e) {
                                await launch(fallbackUrl, forceSafariVC: false);
                              }
                            }))),
              )))
          .values
          .toList(),
    );
  }
}
