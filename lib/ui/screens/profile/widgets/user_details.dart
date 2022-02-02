import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'user_info_tag.dart';

class UserDetailsSection extends StatelessWidget {
  const UserDetailsSection({Key? key}) : super(key: key);

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
                    Container(
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 2, color: Colors.white)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: UserSessionManager
                                .shared.profilePicture!.sizes.isNotEmpty
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: AppText(
                          text: Globals.userInfo.humanName.fullName,
                          style: TextTypes.headline5),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AppText(
                          text: Globals.userId, style: TextTypes.caption),
                    ),
                    FittedBox(
                      child: UserInfoTag(
                          icon: kProfileuserIcon,
                          title: Globals.userInfo.humanName.fullName),
                    ),
                    FittedBox(
                      child: UserInfoTag(
                          icon: kProfileEmailIcon,
                          title: Globals.userInfo.email),
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
