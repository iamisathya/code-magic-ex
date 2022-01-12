import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

Padding clearIcon(
        {double s = 33.0,
        IconData i = Icons.clear,
        Color c = Colors.black,
        Function()? onPressed}) =>
    Padding(
      padding: kEdgeInset(),
      child: Icon(
        i,
        size: s,
        color: c,
      ),
    );
