import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TabMeiShiPage extends StatefulWidget {
  TabMeiShiPage({Key key}) : super(key: key);

  @override
  _TabMeiShiPageState createState() => _TabMeiShiPageState();
}

class _TabMeiShiPageState extends State<TabMeiShiPage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  String url1 = "http://10.13.1.117:5001/";
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: Text("摄像头管理"),
        //   ),
        //   body: Container(
        //     child:
        //   ),
        // );
        MaterialApp(
      routes: {
        "/": (_) => WebviewScaffold(
              useWideViewPort: true,
              displayZoomControls: true,
              withOverviewMode: true,
              url: url1, //"http://10.13.1.117:5001/",
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text("主摄像头"),
              ),
            )
      },
    );
  }
}
