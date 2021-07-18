import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class tabFence extends StatefulWidget {
  tabFence({Key key}) : super(key: key);

  @override
  _tabFenceState createState() => _tabFenceState();
}

class _tabFenceState extends State<tabFence> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  String url = "http://10.13.1.117:5001/fence";
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
