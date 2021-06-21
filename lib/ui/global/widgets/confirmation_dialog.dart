import 'package:code_magic_ex/resources/font_weights.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog {
  ConfirmationDialog._();

  static Future<bool> show<bool>({
    required BuildContext context,
    required String message,
    String title = "Alert!",
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
            title: Text(title,
                style: const TextStyle(fontWeight: AppFontWeight.bold)),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText, 
                    style: const TextStyle(fontSize: 14, color: Colors.black),),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(okText, style: const TextStyle(fontSize: 14, color: Colors.black)),
              )
            ],
          ),
        );
      },
    );
    return result!;
  }
}
