import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/navigation/router.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/profile/profile.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 440,
              color: AppColor.sunglow,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColor.kWhiteColor,
                      ),
                      height: 102,
                      width: 102,
                      child: Image.network(
                          "https://developers.google.com/search/images/google-search-central-logo.png",
                          height: 90,
                          width: 90),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: AppText(text: "Sathya", style: TextTypes.headline5),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: AppText(text: "Sathya", style: TextTypes.caption),
                  ),
                  const UserInfoTag(
                      icon: kCameraIcon, title: 'Unicity DSC Thailand'),
                  const UserInfoTag(
                      icon: kCameraIcon, title: 'Sathyanarayana@#mail.com'),
                  const UserInfoTag(icon: kCameraIcon, title: '9980499055'),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                AccountSetting(),
                NotificationSetting(),
                TermsConditionsSetting(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(kCameraIcon, width: 40, height: 40),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child:
                    AppText(text: 'Notifications', style: TextTypes.headline5),
              )
            ],
          ),
          Switch.adaptive(
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class TermsConditionsSetting extends StatelessWidget {
  const TermsConditionsSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(ScreenPaths.termsConditions),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(kCameraIcon, width: 40, height: 40),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: AppText(
                      text: 'Terms & Condotions', style: TextTypes.headline5),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSetting extends GetView<UserProfileController> {
  AccountSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(kCameraIcon, width: 40, height: 40),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child:
                  AppText(text: 'Account Setting', style: TextTypes.headline5),
            )
          ],
        ),
        TextButton(
            onPressed: controller.pickImage,
            child: AppText(
                text: "Edit profile Picture", style: TextTypes.subtitle1)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextButton(
              onPressed: controller.onPressUpdatePassword,
              child: AppText(text: "Change Email", style: TextTypes.subtitle1)),
        ),
        TextButton(
            onPressed: controller.onPressUpdateEmail,
            child: AppText(text: "Change Password", style: TextTypes.subtitle1))
      ]),
    );
  }
}

class UserInfoTag extends StatelessWidget {
  const UserInfoTag({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.kWhiteColor),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(icon, width: 10, height: 10),
            ),
            AppText(text: title, style: TextTypes.caption),
          ],
        ));
  }
}
