import 'package:code_magic_ex/utilities/images.dart';
import 'package:flutter/material.dart';

class ProgressBar {
  late OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createdProgressEntry(context);
    Overlay.of(context)!.insert(_progressOverlayEntry);
  }

  void hide() {
    if (_progressOverlayEntry.mounted) {
      _progressOverlayEntry.remove();
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
      builder: (BuildContext context) => Stack(
            children: <Widget>[
              Container(
                color: Colors.white.withOpacity(0.6),
              ),
              Positioned.fill(
                child: Align(
                  child: Image.asset(
                    kAnimatedLoader,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
              )
            ],
          ));
}
