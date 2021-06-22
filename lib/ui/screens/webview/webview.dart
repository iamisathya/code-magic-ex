import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:code_magic_ex/ui/global/theme/bloc.dart';

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
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  late StreamSubscription<double> _onProgressChanged;
  double currentProgress = 0.0;
  bool canHideWebview = true;

  @override
  void initState() {
    super.initState();
    _onProgressChanged =
        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {
        if (progress == 1.0) {
          setState(() {
            canHideWebview = false;
          });
        }
        setState(() {
          currentProgress = progress;
        });
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onProgressChanged.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return WebviewScaffold(
        appBar: AppBar(
          title: const Text("Webview"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.close,
              ),
              tooltip: 'Close webview',
              onPressed: () => themeBloc.toggleThemeMode,
            ),
          ],
        ),
        withZoom: true,
        useWideViewPort: true,
        url: widget.url, 
        );
  }
}
