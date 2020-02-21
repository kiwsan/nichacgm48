import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nichacgm48/blocs/profile_bloc.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/models/profile_model.dart';
import 'package:nichacgm48/styles/colors.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/footer_widget.dart';
import 'package:nichacgm48/ui/widgets/head_widget.dart';
import 'package:nichacgm48/ui/widgets/layout_widget.dart';
import 'package:nichacgm48/utils/fade_animation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  ScrollController _scrollController;

  bool get isShrink =>
      _scrollController.hasClients &&
      _getAppBarCollapsePercent() >
          (ScreenUtil().setHeight(300) - kToolbarHeight);

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  double _getAppBarCollapsePercent() {
    if (!_scrollController.hasClients ||
        // ignore: invalid_use_of_protected_member
        _scrollController.positions.length > 1) {
      return ScreenUtil().setHeight(170);
    }

    return _scrollController.offset;
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();

    registerNotification();
    configLocalNotification();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);

    //api
    profileBLoc.fetchProfile();

    return Scaffold(
        body: NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: ScreenUtil().setHeight(350),
            pinned: true,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(globalPadding),
                  bottom: ScreenUtil().setWidth(20),
                  top: ScreenUtil().setWidth(20)),
              child: isShrink
                  ? CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'))
                  : Container(),
            ),
            title: isShrink
                ? Text(
                    "Nicha CGM48",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: grey800TextColor,
                        fontWeight: FontWeight.normal),
                  )
                : Container(),
            backgroundColor: isShrink ? Colors.white : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(0),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(globalPadding),
                        right: ScreenUtil().setWidth(globalPadding),
                        top: ScreenUtil().setWidth(60)),
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
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
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

    _firebaseMessaging.getToken().then((token) {
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
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
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
    await _flutterLocalNotificationsPlugin.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));
  }
}

class _Profile extends StatelessWidget {
  final Profile profile;

  _Profile({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        1,
        Image.network(
          profile.image,
          width: ScreenUtil().setWidth(695),
          height: ScreenUtil().setHeight(1020),
        ));
  }
}
