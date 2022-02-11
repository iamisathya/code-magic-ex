import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/enums.dart';
import '../../../../data/provider/globals.dart';
import '../../../../widgets/text_view.dart';
import '../../../core/values/colors.dart';
import '../../../utils/images.dart';
import '../controller/profile.controller.dart';
import 'user_info_tag.dart';

class UserDetailsSection extends StatelessWidget {
  UserDetailsSection({Key? key}) : super(key: key);

  final UserProfileController _controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SvgPicture.asset(
          kProfileBacgroundImage,
          height: 40,
        ),
        Column(
          children: <Widget>[
            Container(
                height: 440,
                width: double.infinity,
                color: AppColor.yellowCrayola,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    6.0,
                                    10.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25.0),
                              border:
                                  Border.all(width: 2, color: Colors.white)),
                          child: Obx(
                            () => ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child:
                                  Globals.profilePicture.value.sizes.isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: Globals.profilePicture.value
                                              .sizes[0].media,
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          kDefaultDistributorImage,
                                          height: 100,
                                          width: 100,
                                        ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          right: 10,
                          child: GestureDetector(
                              onTap: _controller.changeProfilePicture,
                              child: SvgPicture.asset(kProfileCameraIcon)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(Globals.userInfo.humanName.fullName,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppColor.kBlackColor)),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AppText(
                          text: Globals.userId, style: TextTypes.subtitle1),
                    ),
                    FittedBox(
                      child: UserInfoTag(
                          icon: kProfileuserIcon,
                          title: Globals.userInfo.humanName.fullName),
                    ),
                    Obx(
                      () => FittedBox(
                        child: UserInfoTag(
                            icon: kProfileEmailIcon,
                            title: Globals.emailAddress.value),
                      ),
                    ),
                    FittedBox(
                      child: UserInfoTag(
                          icon: kProfilePhoneIcon,
                          title: Globals.userInfo.homePhone),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
