import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/user_session.dart';
import '../controller/dashboard.controller.dart';

class ProfileImage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

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
                  color: AppColor.brightGray,
                  border: Border.all(color: AppColor.kWhiteColor, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child:
                    UserSessionManager.shared.profilePicture!.sizes.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: UserSessionManager
                                .shared.profilePicture!.sizes[0].media,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: 100,
                            width: 100,
                          )
                        : Image.asset(
                            kDefaultDistributorImage,
                            height: 100,
                            width: 100,
                          ),
              )),
          Positioned(
            bottom: -5,
            left: -5,
            child: GestureDetector(
                onTap: () => controller.changeProfilePicture(context),
                child: SvgPicture.asset(kCameraIcon,
                    height: 20, semanticsLabel: "camera icon")),
          ),
        ],
      ),
    );
  }
}
