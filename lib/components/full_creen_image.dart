import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nichacgm48/common/read_more_text.dart';
import 'package:nichacgm48/common/scale_size.dart';
import 'package:nichacgm48/models/instagram_post.dart';
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
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _post,
              itemCount: widget.posts.edges.length,
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/instagram_icon.png",
                            width: ScaleSize.safeBlockHorizontal * 4,
                            height: ScaleSize.safeBlockVertical * 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
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
                        height: ScaleSize.safeBlockHorizontal * 0.2,
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
