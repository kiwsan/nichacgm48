import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/ui/widgets/appbar_widget.dart';
import 'package:nichacgm48/ui/widgets/search_box_widget.dart';
import 'package:nichacgm48/ui/widgets/shop_category_widget.dart';
import 'package:nichacgm48/ui/widgets/shop_promotion_widget.dart';
import 'package:nichacgm48/ui/widgets/shop_trending_widget.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(Constants.LayoutPadding2),
              right: ScreenUtil().setWidth(Constants.LayoutPadding2),
              top: ScreenUtil().setWidth(35)),
          child: Column(
            children: <Widget>[
              SearchBoxWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
              ShopCategoryWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
              ShopPromotionWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
              ShopTrendingWidget()
            ],
          ),
        ));
  }
}