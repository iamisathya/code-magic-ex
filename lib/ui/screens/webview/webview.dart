import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:code_magic_ex/ui/global/theme/bloc.dart';

class WebivewHomeScreen extends StatefulWidget {
  static const String routeName = '/mainHomePage';

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
        if(progress == 1.0) {
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
      url:'https://facebook.com'
          // 'https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f7520ff03edcb153eeed5e2d6ab775a39f01&token=fce3ca65-b961-4961-bfce-cd8ffe7e5134',
    );
  }
}
