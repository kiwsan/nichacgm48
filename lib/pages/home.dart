import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nichacgm48/common/app_constant.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/components/footer_widget.dart';
import 'package:nichacgm48/components/head_widget.dart';
import 'package:nichacgm48/components/layout_widget.dart';
import 'package:nichacgm48/models/firebase_notification.dart';
import 'package:nichacgm48/styleguide/text_styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final List<FirebaseNotification> notifications = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            FirebaseNotification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.red,
            ),
          );
        });
      },
      onLaunch: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            FirebaseNotification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.green,
            ),
          );
        });
      },
      onResume: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            FirebaseNotification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.blue,
            ),
          );
        });
      },
    );

    _firebaseMessaging.requestNotificationPermissions();

    /*_firebaseMessaging.getToken().then((token) {
      print(token);
    }).catchError((e) {
      print(e);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    ScaleSize().init(context);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: ScaleSize.safeBlockHorizontal * 40,
              pinned: true,
              elevation: 0,
              titleSpacing: 0,
              floating: true,
              // leading: Icon(Icons.menu),
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: globalPadding,
                      child: HeadWidget(),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 35.0,
                    color: Colors.black45,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(ScaleSize.safeBlockHorizontal * 55,
                  ScaleSize.safeBlockVertical - 200),
              child: Transform.rotate(
                angle: -4.2,
                child: Image.asset(
                  'assets/icons/ellipse_top_left.png',
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(ScaleSize.safeBlockHorizontal - 80,
                  ScaleSize.safeBlockVertical * 50),
              child: Transform.rotate(
                angle: -1,
                child: Image.asset('assets/icons/ellipse_middle_right.png',
                    width: 100),
              ),
            ),
            Transform.translate(
              offset: Offset(ScaleSize.safeBlockHorizontal * 92,
                  ScaleSize.safeBlockVertical * 90),
              child: Transform.rotate(
                angle: -2,
                child: Image.asset('assets/icons/ellipse_center_buttom.png',
                    width: 100),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: globalPadding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/h_nicha.png",
                                width: ScaleSize.safeBlockHorizontal * 65,
                                height: ScaleSize.safeBlockHorizontal * 90,
                              )
                            ]),
                        Column(
                          children: <Widget>[
                            Text(
                              "CGM48",
                              style: bandNameTextStyle,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  LayoutWidget(),
                  SizedBox(
                    height: ScaleSize.safeBlockVertical * 4,
                  ),
                  Padding(
                    padding: globalPadding,
                    child: FooterWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
