import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/transparent_app_bar.dart';

class WebivewHomeScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebivewHomeScreen({
    this.url = "",
    this.title = "Webpgae",
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
      appBar: TransAppBar(
        title: widget.title,
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
          if (isLoading)
            LinearProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            )
          else
            Stack(),
        ],
      ),
    );
  }
}
