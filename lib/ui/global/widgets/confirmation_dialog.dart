import 'package:flutter/material.dart';

import '../../../styles/font_weights.dart';

class ConfirmationDialog {
  ConfirmationDialog._();

  static Future<bool> show<bool>({
    required BuildContext context,
    required String message,
    String title = "Logout!",
    String okText = "Ok",
    String cancelText = "Cancel",
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(title,
                style: const TextStyle(fontWeight: AppFontWeight.bold)),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  cancelText,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(okText,
                    style: const TextStyle(fontSize: 14, color: Colors.red)),
              )
            ],
          ),
        );
      },
    );
    return result!;
  }
}
