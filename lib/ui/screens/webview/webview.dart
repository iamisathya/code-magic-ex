import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:code_magic_ex/ui/global/theme/bloc.dart';

class WebivewHomeScreen extends StatefulWidget {
  static const String routeName = '/mainHomePage';

  @override
  _WebivewHomeScreenState createState() => _WebivewHomeScreenState();
}

class _WebivewHomeScreenState extends State<WebivewHomeScreen> {
  @override
  void initState() {
    super.initState();
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
      initialChild: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      withZoom: true,
      useWideViewPort: true,
      url:
          'https://dsc-th.unicity.com/invoice.php?link=https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f7520ff03edcb153eeed5e2d6ab775a39f01&token=fce3ca65-b961-4961-bfce-cd8ffe7e5134',
    );
  }
}
