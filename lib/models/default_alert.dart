import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class DafultAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;

  const DafultAlertDialog({
    required this.title,
    required this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText = "Continue",
    this.negativeBtnText = "Cancel",
    required this.onPostivePressed,
    required this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      content: Text(message),
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onNegativePressed();
          },
          child: Text(
            negativeBtnText,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () => onPostivePressed,
          child: Text(
            positiveBtnText,
            style: const TextStyle(color: kMainColor),
          ),
        ),
      ],
    );
  }
}

//? Example use
// final DafultAlertDialog dialog = DafultAlertDialog(
//             title: "Logout",
//             message: "Are you sure, do you want to logout?",
//             onPostivePressed: () {},
//             positiveBtnText: 'Yes',
//             negativeBtnText: 'No',
//             onNegativePressed: () {});
// showDialog(context: context, builder: (BuildContext context) => dialog);
