import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/colors.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/footer_widget.dart';
import 'package:nichacgm48/ui/widgets/head_widget.dart';
import 'package:nichacgm48/ui/widgets/layout_widget.dart';
import 'package:nichacgm48/utils/fade_animation.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double expandedHeight = 335;

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
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: ScreenUtil().setHeight(expandedHeight),
            pinned: true,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(globalPadding),
                  bottom: ScreenUtil().setWidth(20),
                  top: ScreenUtil().setWidth(20)),
              child: _isShrink
                  ? CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'))
                  : Container(),
            ),
            title: _isShrink
                ? Text(
                    "Nicha CGM48",
                    style: appBarTitleTextStyle,
                  )
                : Container(),
            backgroundColor: _isShrink ? Colors.white : Colors.transparent,
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
                                  width: ScreenUtil().setWidth(750),
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
    );
  }
}
