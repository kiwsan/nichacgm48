import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/supporter_bloc.dart';
import 'package:nichacgm48/models/supporter_model.dart';
import 'package:nichacgm48/ui/widgets/progressbar_widget.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/supporter_item_widget.dart';

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
                        return SupporterItemWidget(supporters: snapshot.data);
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
