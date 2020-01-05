import 'package:flutter/material.dart';
import 'package:nichacgm48/common/scale_size.dart';

class ToolBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          child: Image.asset(
            'assets/icons/menu.png',
            width: ScaleSize.safeBlockHorizontal * 8,
            height: ScaleSize.safeBlockVertical * 8,
          ),
          onTap: () {
            //Navigation to another page
          },
        ),
        Icon(
          Icons.search,
          size: ScaleSize.safeBlockHorizontal * 8,
        )
      ],
    );
  }
}
