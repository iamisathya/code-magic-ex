// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/cupertino.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
