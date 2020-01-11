import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nichacgm48/models/instagram_post.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImage extends StatefulWidget {
  final List<InstagramPost> posts;
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
              itemCount: widget.posts.length,
              loadingChild: widget.loadingChild,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "", //Write text on image
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _post(BuildContext context, int index) {
    final InstagramPost post = widget.posts[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(post.photoLargeUrl),
      heroAttributes: PhotoViewHeroAttributes(tag: "tag$index"),
    );
  }
}
