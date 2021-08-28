
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

class WebViewDemo extends StatelessWidget { 
String createdViewId='webview';

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
     ui.platformViewRegistry.registerViewFactory(
        createdViewId,
            (int viewId) => html.IFrameElement()
          ..src = 'assets/index.html'           
          ..style.border = 'none');
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: HtmlElementView(
              viewType: createdViewId,
            )));
  }
}