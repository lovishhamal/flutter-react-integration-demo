import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class LoadReactScreen extends StatefulWidget {
  @override
  _LoadReactScreenState createState() => _LoadReactScreenState();
}

class _LoadReactScreenState extends State<LoadReactScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('React Webview example'),
      ),
      body: Column(children: [
        LoadReact(controller:_controller.future),
        Builder(builder: (BuildContext context) {
        return Expanded(child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          gestureNavigationEnabled: true,
        ),);
      }),],)
    );
  }
}

class LoadReact extends StatelessWidget {
final Future<WebViewController> controller;
  final CookieManager cookieManager = CookieManager();
  
  LoadReact({required this.controller,});

  void _init(
    WebViewController controller, BuildContext context) async {
     String html= await rootBundle.loadString('assets/index.html');
    controller.loadUrl(Uri.dataFromString(
       html,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
            _init(controller.data!, context);
        return Text('') ;
      },
    );
  }
}