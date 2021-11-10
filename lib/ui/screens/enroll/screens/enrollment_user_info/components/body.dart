import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/components/enroll_textfield.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/controller/enrollment.userinfo.controller.dart';
import 'package:dsc_tools/ui/screens/inventory/component/page_title.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final EnrollmentUserInfoController controller =
      Get.put(EnrollmentUserInfoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.hideButtonController,
      child: SafeArea(
        child: Column(
          children: [
            const PageTitle(title: "Enrollment Details"),
            Container(
              color: const Color(0xFF76E5DE),
              padding: const EdgeInsets.all(20),
              height: 134,
              child: Row(
                children: const [
                  UserInfoCard(
                      title: "Enroller ID",
                      id: "108357166",
                      name: "Saoirse Worcestershire",
                      nativeName: "ฏิญฐ์ ฌิฎฌื่ณ"),
                  SizedBox(width: 10),
                  UserInfoCard(
                      title: "Sponsor ID",
                      id: "108357166",
                      name: "Saoirse Worcestershire",
                      nativeName: "ฏิญฐ์ ฌิฎฌื่ณ"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: AppText(text: "Information", style: TextTypes.headline6),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'First Name (Thai)',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Last Name (Thai)',
                      textInputAction: TextInputAction.next),
                  const SizedBox(height: 20),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'First Name',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Last Name',
                      textInputAction: TextInputAction.next),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: EnrollTextField(
                            controller: controller.nativeFirstNameController,
                            isLoading: controller.isLoading.value,
                            label: 'Last Name',
                            icon: Icons.add,
                            showIcon: true,
                            textInputAction: TextInputAction.next),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: EnrollTextField(
                            controller: controller.nativeFirstNameController,
                            isLoading: controller.isLoading.value,
                            label: 'Last Name',
                            icon: Icons.add,
                            showIcon: true,
                            textInputAction: TextInputAction.next),
                      ),
                    ],
                  ),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Birth Day',
                      icon: Icons.add,
                      showIcon: true,
                      textInputAction: TextInputAction.next),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                            text: "Contact Address", style: TextTypes.headline6),
                        SvgPicture.asset(kSearchV2Icon, width: 20)
                      ],
                    ),
                  ),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Zip Code',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Province',
                      icon: Icons.add,
                      showIcon: true,
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'District - Subdistrict',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Address - Street',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Mobile Number',
                      textInputAction: TextInputAction.next),
                  EnrollTextField(
                      controller: controller.nativeFirstNameController,
                      isLoading: controller.isLoading.value,
                      label: 'Email',
                      textInputAction: TextInputAction.next),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    required this.id,
    required this.nativeName,
    required this.name,
    required this.title,
  }) : super(key: key);

  final String id;
  final String nativeName;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: const Color(0xFFFFFFFF)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 10,
                    color: const Color(0xFF505050),
                  ),
            ),
            AppText(
                text: id,
                style: TextTypes.subtitle1,
                color: const Color(0xFF384250)),
            AppText(
                text: name,
                style: TextTypes.bodyText1,
                color: const Color(0xFF384250)),
            Text(
              nativeName,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 10,
                    color: const Color(0xFF384250),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
