import 'dart:convert';
import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/profile_bloc.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/colors.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/donate.dart';
import 'package:nichacgm48/ui/profile.dart';
import 'package:nichacgm48/ui/project.dart';
import 'package:nichacgm48/ui/shop.dart';
import 'package:nichacgm48/ui/widgets/head_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  int _currentIndex;

  ScrollController _scrollController;

  bool get isShrink {
    if (_currentIndex > 0) {
      return true;
    }

    return _scrollController.hasClients &&
        _getAppBarCollapsePercent() >
            (ScreenUtil().setHeight(300) - kToolbarHeight);
  }

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

    _currentIndex = 0;

    registerNotification();
    configLocalNotification();
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  final List<Widget> _pages = [ProfilePage(), ProjectPage(), ShopPage()];

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
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'))
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
                        child: _currentIndex > 0 ? Container() : HeadWidget(),
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
          body: SafeArea(
            top: false,
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigationToDonate(context);
          },
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
          currentIndex: _currentIndex,
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
                title: Text("HOME", style: bubbleBottomBarMenuTextStyle)),
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
                title: Text("PROJECTS", style: bubbleBottomBarMenuTextStyle)),
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
                  "SHOP",
                  style: bubbleBottomBarMenuTextStyle,
                )),
          ],
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

  void _navigationToDonate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DonatePage(),
      ),
    );
  }
}
