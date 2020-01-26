import 'package:flutter/material.dart';

class FirebaseNotificationModel {
  final String title;
  final String body;
  final Color color;

  const FirebaseNotificationModel(
      {@required this.title, @required this.body, @required this.color});
}
