import 'package:flutter/material.dart';

class FirebaseNotification {
  final String title;
  final String body;
  final Color color;

  const FirebaseNotification(
      {@required this.title, @required this.body, @required this.color});
}
