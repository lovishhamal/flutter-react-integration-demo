
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String menuData = '''
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>React integration with flutter</title>
  </head>
  <body>
   <div id="root" ></div>
    <script src="https://unpkg.com/react@17/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
   <script type="text/babel">
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  render() {
    const colors=['red','black','yellow','green','pink'];
    let index=Math.floor(Math.random()*6);
    return (
      <div style={{
          display: "flex",
          flexDirection:"column",
          justifyContent: "center",
          alignItems: "center",
        }}>
        <h2 style={{fontSize:'50px'}}>Click on add button</h2>
      <h1 style={{fontSize:'50px',color:colors[index]}}>Count is: {this.state.count}</h1>
      <button style={{fontSize:'40px'}} type="button" onClick={()=>this.setState({count:this.state.count+1})}>Increment count</button>
      </div>
    );
  }
}
		ReactDOM.render(<App/>, document.getElementById('root'));
    </script>
  </body>
</html>

''';

class Html extends StatefulWidget {
  @override
  _HtmlState createState() => _HtmlState();
}

class _HtmlState extends State<Html> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('React example'),
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

  void _onPressed(
    WebViewController controller, BuildContext context) async {
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(menuData));
    await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
            _onPressed(controller.data!, context);
        return Text('') ;
      },
    );
  }
}