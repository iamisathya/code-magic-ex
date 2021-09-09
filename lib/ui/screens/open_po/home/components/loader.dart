import 'package:flutter/material.dart';

import '../../../../../utilities/images.dart';

class Loader extends StatelessWidget {
  const Loader(
      {this.opacity = 0.5,
      this.dismissibles = false,
      this.color = Colors.black});

  final double opacity;
  final bool dismissibles;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kAnimatedLoader2),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
