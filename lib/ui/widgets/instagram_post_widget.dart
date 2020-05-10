import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/models/instagram_post_model.dart';
import 'package:nichacgm48/ui/widgets/full_creen_image.dart';

class InstagramPostWidget extends StatelessWidget {
  final EdgeOwnerToTimelineMedia posts;

  InstagramPostWidget({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: posts.edges
            .asMap()
            .map((i, post) => MapEntry(
            i,
            ClipRRect(
              borderRadius:
              BorderRadius.circular(ScreenUtil().setWidth(20)),
              child: Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                child: GestureDetector(
                  onTap: () {
                    _navigationToFullScreenImage(context, i);
                  },
                  child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        width: ScreenUtil().setWidth(380),
                        height: ScreenUtil().setHeight(425),
                        color: Colors.black12,
                      ),
                      imageUrl: post.node.thumbnailSrc,
                      width: ScreenUtil().setWidth(380),
                      height: ScreenUtil().setHeight(425),
                      fit: BoxFit.cover),
                ),
              ),
            )))
            .values
            .toList());
  }

  void _navigationToFullScreenImage(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(
          posts: posts,
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
          fontSize: ScreenUtil().setSp(35),
        ),
      ),
    );
  }

}
