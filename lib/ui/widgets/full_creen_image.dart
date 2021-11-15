import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/utils/read_more_text.dart';
import 'package:nichacgm48/models/instagram_post_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:time_formatter/time_formatter.dart';

class FullScreenImage extends StatefulWidget {
  final EdgeOwnerToTimelineMedia posts;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final int initialIndex;
  final PageController pageController;
  final Axis scrollDirection;
  final fontSize;

  FullScreenImage(
      {this.loadingChild,
      this.backgroundDecoration,
      this.initialIndex,
      @required this.posts,
      this.scrollDirection = Axis.horizontal,
      this.fontSize})
      : pageController = PageController(initialPage: initialIndex);

  @override
  _FullScreenImageScreen createState() => _FullScreenImageScreen();
}

class _FullScreenImageScreen extends State<FullScreenImage> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String publishedOn = formatTime(
        widget.posts.edges[currentIndex].node.takenAtTimestamp * 1000);
    var caption = widget
        .posts.edges[currentIndex].node.edgeMediaToCaption.edges[0].node.text;

    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: BouncingScrollPhysics(),
              builder: _post,
              itemCount: widget.posts.edges.length,
              // ignore: deprecated_member_use
              loadingChild: widget.loadingChild,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/instagram_icon.png",
                            width: ScreenUtil().setWidth(40),
                            height: ScreenUtil().setHeight(40),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(15)),
                            child: Text(
                              "Nicha CGM48 on Instagram [$publishedOn]",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.fontSize,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(0.2),
                      ),
                      ReadMoreText(
                        caption,
                        //Write text on image
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.fontSize,
                            fontWeight: FontWeight.normal),
                        trimLength: 150,
                        colorClickableText: Colors.amber,
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: ScreenUtil().setWidth(70),
                              left: ScreenUtil().setWidth(10)),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: ScreenUtil().setWidth(70),
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setWidth(70)),
                          child: IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              size: ScreenUtil().setWidth(80),
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ])
                ]),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _post(BuildContext context, int index) {
    final post = widget.posts.edges[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(post.node.displayUrl),
      heroAttributes: PhotoViewHeroAttributes(tag: "tag$index"),
    );
  }
}
