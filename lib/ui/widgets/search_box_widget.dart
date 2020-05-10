import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';

class SearchBoxWidget extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(Constants.LayoutPadding2),
          top: ScreenUtil().setWidth(35)),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setSp(30)),
        ),
        child: ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.black54,
            ),
            title: TextField(
              controller: controller,
              decoration: new InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: hintSearchTextStyle),
            ),
            enabled: true,
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {},
            ),
            onTap: () {
              /* react to the tile being tapped */
            }),
      ),
    );
  }
}
