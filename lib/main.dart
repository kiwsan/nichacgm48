import 'package:flutter/material.dart';
import 'package:nichacgm48/ui/home.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatefulWidget {
  @override
  _FlutterAppState createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nicha CGM48 Thailand Fanclub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          canvasColor: Colors.white,
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          accentColor: Colors.white,
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto'),
      home: HomePage(),
    );
  }
}
