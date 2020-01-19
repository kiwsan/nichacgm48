import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nichacgm48/common/app_constant.dart';
import 'package:nichacgm48/common/fade_animation.dart';
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

  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;

    _initialFirebase();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
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
              offset: Offset(ScaleSize.safeBlockHorizontal - 82,
                  ScaleSize.safeBlockVertical * 50),
              child: Transform.rotate(
                angle: -1,
                child: SvgPicture.asset('assets/icons/ellipse_middle_right.svg',
                    width: ScaleSize.safeBlockHorizontal * 24),
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
                                    height: ScaleSize.safeBlockHorizontal * 90,
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
      ),
    );
  }

  /* Mimic a delay and add a random value to the list */
  Future<Null> refreshPage() async {
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

  void _initialFirebase() {
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
}
