import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:code_magic_ex/utilities/constants.dart';

class WebivewHomeScreen extends StatefulWidget {
  static const String routeName = '/webviewHomePage';
  final String url;

  const WebivewHomeScreen({
    this.url = "",
    Key? key,
  }) : super(key: key);

  @override
  _WebivewHomeScreenState createState() => _WebivewHomeScreenState();
}

class _WebivewHomeScreenState extends State<WebivewHomeScreen> {
  // Instance of WebView plugin
  double currentProgress = 0.0;
  bool canHideWebview = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Webview"),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (!isLoading)
            const LinearProgressIndicator(
              color: kPrimaryColor,
            )
          else
            Stack(),
        ],
      ),
    );
  }
}
