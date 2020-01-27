import 'dart:convert';
import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
                      Icons.notifications,
                      size: 35.0,
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
                offset: Offset(ScaleSize.safeBlockHorizontal * 55,
                    ScaleSize.safeBlockVertical - 200),
                child: Transform.rotate(
                  angle: -4.2,
                  child: SvgPicture.asset(
                    'assets/icons/ellipse_top_left.svg',
                    width: ScaleSize.safeBlockHorizontal * 95,
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
                  child: SvgPicture.asset(
                      'assets/icons/ellipse_center_buttom.svg',
                      width: ScaleSize.safeBlockHorizontal * 24),
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
                                FadeAnimation(
                                    1,
                                    Image.asset(
                                      "assets/images/h_nicha.png",
                                      width: ScaleSize.safeBlockHorizontal * 65,
                                      height:
                                          ScaleSize.safeBlockHorizontal * 90,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.payment,
            color: Colors.black87,
          ),
          backgroundColor: Colors.yellow[600],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          //border radius doesn't work when the notch is enabled.
          elevation: 8,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.yellow[500],
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black54,
                ),
                title: Text("Home", style: bubbleBottomBarMenuTextStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.yellow[500],
                icon: Icon(
                  Icons.apps,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.apps,
                  color: Colors.black54,
                ),
                title: Text("Projects", style: bubbleBottomBarMenuTextStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.yellow[500],
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black54,
                ),
                title: Text(
                  "Shop",
                  style: bubbleBottomBarMenuTextStyle,
                )),
          ],
        ));
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
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
