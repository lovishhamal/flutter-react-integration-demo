
import 'package:flutter/material.dart';
import 'mobileui.dart' if (dart.library.html) 'webui.dart' as multiPlatform;

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: multiPlatform.WebViewDemo() ,);
  }
}
