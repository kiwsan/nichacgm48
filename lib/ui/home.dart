import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/footer_widget.dart';
import 'package:nichacgm48/ui/widgets/head_widget.dart';
import 'package:nichacgm48/ui/widgets/layout_widget.dart';
import 'package:nichacgm48/utils/fade_animation.dart';
import 'package:nichacgm48/utils/scale_size.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;

    registerNotification();
    configLocalNotification();
  }

  @override
  Widget build(BuildContext context) {
    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: ScreenUtil().setHeight(440),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(globalPadding)),
                    child: HeadWidget(),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: ScreenUtil().setWidth(90),
                  color: Colors.black54,
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
            offset: Offset(
                ScreenUtil().setWidth(590), ScreenUtil().setHeight(-650)),
            child: Transform.rotate(
              angle: -4.1,
              child: SvgPicture.asset(
                'assets/icons/ellipse_top_left.svg',
                width: ScreenUtil().setWidth(1250),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
                ScreenUtil().setHeight(-250), ScreenUtil().setHeight(900)),
            child: Transform.rotate(
              angle: -0.5,
              child: SvgPicture.asset(
                'assets/icons/ellipse_middle_right.svg',
                width: ScreenUtil().setWidth(250),
                height: ScreenUtil().setHeight(300),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
                ScreenUtil().setWidth(995), ScreenUtil().setHeight(1700)),
            child: Transform.rotate(
              angle: -1.5,
              child: SvgPicture.asset('assets/icons/ellipse_center_buttom.svg',
                  width: ScreenUtil().setWidth(220)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(globalPadding)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Image.asset(
                                  "assets/images/h_nicha.png",
                                  width: ScreenUtil().setWidth(695),
                                  height: ScreenUtil().setHeight(1020),
                                ))
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
                  height: ScreenUtil().setHeight(50),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(globalPadding)),
                  child: FooterWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void registerNotification() {
    firebaseMessaging.requestNotificationPermissions();

    firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      print('onMessage: $message');
      showNotification(message['notification']);
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      return;
    });

    firebaseMessaging.getToken().then((token) {
      //print('token: $token');
    }).catchError((err) {
      print(err.message.toString());
    });
  }

  void configLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid ? 'com.kiwsan' : 'com.kiwsan',
      'nichacgm48',
      'Nicha CGM48 Thailand fans application',
      playSound: true,
      enableVibration: true,
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));
  }
}
