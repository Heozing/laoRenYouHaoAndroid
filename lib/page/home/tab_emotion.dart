import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class tabEmotion extends StatefulWidget {
  tabEmotion({Key key}) : super(key: key);

  @override
  _tabEmotionState createState() => _tabEmotionState();
}

class _tabEmotionState extends State<tabEmotion> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  String url = "http://10.13.1.117:5001/emotion";
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
                title: Text("表情识别"),
              ),
            )
      },
    );
  }
}
