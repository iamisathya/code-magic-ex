import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utilities/images.dart';
import '../../../../utilities/user_session.dart';

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: const Color(0xFFE3E8ED),
                  border: Border.all(color: const Color(0xFFFFFFFF), width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child: CachedNetworkImage(
                  imageUrl:  UserSessionManager.shared.profilePicture!.sizes.isNotEmpty ? 
                      UserSessionManager.shared.profilePicture!.sizes[0].media : "",
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 100,
                  width: 100,
                ),
              )),
          Positioned(
              bottom: -5,
              left: -5,
              child: SvgPicture.asset(kCameraIcon,
                  height: 20, semanticsLabel: "camera icon")),
        ],
      ),
    );
  }
}
