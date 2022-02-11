import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: PhotoView(
        tightMode: true,
        imageProvider: const NetworkImage(
            "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png"),
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}
