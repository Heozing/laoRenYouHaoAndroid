import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class tabActivity extends StatefulWidget {
  tabActivity({Key key}) : super(key: key);

  @override
  _tabActivityState createState() => _tabActivityState();
}

class _tabActivityState extends State<tabActivity> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  String url = "http://10.13.1.117:5001/activity";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => WebviewScaffold(
              useWideViewPort: true,
              displayZoomControls: true,
              withOverviewMode: true,
              url: url,
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text("义工交互检测"),
              ),
            )
      },
    );
  }
}
