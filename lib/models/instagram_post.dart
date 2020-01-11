import 'package:flutter/material.dart';

class InstagramPost {
  final String photoSmallUrl;
  final String photoMediumUrl;
  final String photoLargeUrl;

  const InstagramPost(
      {@required this.photoSmallUrl,
      @required this.photoMediumUrl,
      @required this.photoLargeUrl});
}
