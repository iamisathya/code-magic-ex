import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../core/values/colors.dart';
import '../../utils/constants.dart';
import '../open_po/order_create/component/app_bar.dart';
import '../open_po/order_create/component/loader.dart';
import 'controllers/orderentry.home.controller.dart';
import 'screens/home/body2.dart';

class OrderEntryHomeScreen extends StatelessWidget {
  final OrderEntryUserListController controller =
      Get.put(OrderEntryUserListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        progressIndicator: const Loader(),
        child: Scaffold(
          backgroundColor: kWhiteSmokeColor,
          appBar: OpenPoAppBar(),
          body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Body()),
          bottomNavigationBar: BottomButtonBar(controller: controller),
        ),
      ),
    );
  }
}

class BottomButtonBar extends StatelessWidget {
  const BottomButtonBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OrderEntryUserListController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const SizedBox()
          : Container(
              height: 90,
              color: AppColor.kWhiteColor,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(
                        title: "cancel".tr, onTap: controller.onCancel),
                  ),
                  Flexible(
                    child: PositiveButton(
                        title: "next".tr,
                        onTap: controller.searchUserBySearchQuery),
                  ),
                ],
              ),
            ),
    );
  }
}

class PositiveButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const PositiveButton({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [AppColor.dodgerBlue, AppColor.skyBlue],
            ),
          ),
          child: Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white))),
    );
  }
}

class NuetralButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const NuetralButton({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: AppColor.pastelBlue,
        ),
        child: Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}

class NegetiveButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const NegetiveButton({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color: AppColor.sunglow,
          ),
          child: Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1)),
    );
  }
}
