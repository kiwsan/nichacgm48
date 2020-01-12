import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nichacgm48/common/read_more_text.dart';
import 'package:nichacgm48/models/instagram_post.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImage extends StatefulWidget {
  final EdgeOwnerToTimelineMedia posts;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final int initialIndex;
  final PageController pageController;
  final Axis scrollDirection;

  FullScreenImage({
    this.loadingChild,
    this.backgroundDecoration,
    this.initialIndex,
    @required this.posts,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

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
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
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
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.black54,
              child: ReadMoreText(
                "${widget.posts.edges[currentIndex].node.edgeMediaToCaption.edges[0].node.text}", //Write text on image
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
                trimLength: 150,
                colorClickableText: Colors.amber,
              ),
            )
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
