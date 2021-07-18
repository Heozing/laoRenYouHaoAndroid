import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class tabFallPage extends StatefulWidget {
  tabFallPage({Key key}) : super(key: key);

  @override
  _tabFallPageState createState() => _tabFallPageState();
}

class _tabFallPageState extends State<tabFallPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  String url = "http://10.13.1.117:5001/fall2";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => WebviewScaffold(
              useWideViewPort: true,
              displayZoomControls: true,
              withOverviewMode: true,
              url: "http://10.13.1.117:5001/fall2",
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text("老人摔倒检测"),
              ),
            )
      },
    );
  }
}
