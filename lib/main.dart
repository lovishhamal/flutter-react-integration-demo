import 'dart:async';
import 'dart:io';
import 'package:demo/LoadUri.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
      int page = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(onPressed: ()=>  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Html()),
  ), child:Text('Press Me! To Load React Content',style: TextStyle(color: Colors.blue),),style:ElevatedButton.styleFrom(
    primary: Colors.white,
  
        )),
      
      ),
      body:  WebView(
          initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          gestureNavigationEnabled: true,
        ),);
  }
}
