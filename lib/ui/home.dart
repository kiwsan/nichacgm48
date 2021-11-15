import 'dart:convert';
import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/blocs/profile_bloc.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/donate.dart';
import 'package:nichacgm48/ui/profile.dart';
import 'package:nichacgm48/ui/project.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  int _currentIndex;
  ScrollController _scrollController;

  bool get _isShrink {
    if (_currentIndex > 0) {
      return true;
    }

    return _scrollController.hasClients &&
        _getAppBarCollapsePercent() >
            (ScreenUtil().setHeight(300) - kToolbarHeight);
  }

  bool lastStatus = true;

  _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
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

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();

    _currentIndex = 0;

    configLocalNotification();
  }

  final List<Widget> _pages = [ProfilePage(), ProjectPage()];

  @override
  Widget build(BuildContext context) {
    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);

    //api
    profileBLoc.fetchProfile();

    return Scaffold(
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var protocolUrl = 'https://www.youtube.com/CGM48official';
            var fallbackUrl = 'https://www.youtube.com/CGM48official';

            try {
              bool launched = await launch(protocolUrl, forceSafariVC: false);
              if (!launched) {
                await launch(fallbackUrl, forceSafariVC: false);
              }
            } catch (e) {
              await launch(fallbackUrl, forceSafariVC: false);
            }
          },
          child: Icon(
            Icons.video_library,
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
                title: Text("PROJECTS", style: bubbleBottomBarMenuTextStyle))
          ],
        ));
  }

  void configLocalNotification() {
    //Android
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@drawable/ic_stat_mood');

    //IOS
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    //INITIAL
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

  sendNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '10000', 'flutter_manual_channel', 'flutter_manual_channel_detail',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
        111, 'Hello!', 'This is a notifications. ', platformChannelSpecifics,
        payload: 'I just need to meet you.');
  }
}
