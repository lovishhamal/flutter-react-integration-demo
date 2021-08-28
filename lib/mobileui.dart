import 'package:demo/loadreact.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  const WebViewDemo({ Key? key }) : super(key: key);

  @override
  _WebViewDemoState createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {

Widget build(BuildContext context) {
return  Scaffold(appBar: AppBar(title: ElevatedButton(onPressed: ()=>  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoadReactScreen()),
  ), child:Text('Press Me! To Load React Content',style: TextStyle(color: Colors.blue),),style:ElevatedButton.styleFrom(
    primary: Colors.white,
  
        )),
    ), body: WebView(
          initialUrl:'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
        ));}
  
}
