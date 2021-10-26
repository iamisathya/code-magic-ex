import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../open_po/home/components/app_bar.dart';
import 'controllers/orderentry.home.controller.dart';
import 'screens/home/body2.dart';

class OrderEntryHomeScreen extends StatelessWidget {
  static const String routeName = '/orderEntryHomePage';
  final OrderEntryUserListController controller =
      Get.put(OrderEntryUserListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
      appBar: OpenPoAppBar(),
      body: Body(),
      bottomNavigationBar: BottomButtonBar(controller: controller),
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
              color: const Color(0xFFFFFFFF),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: NegetiveButton(title: "cancel".tr, onTap: controller.onCancel),
                  ),
                  Flexible(
                    child: PositiveButton(title: "next".tr, onTap: controller.onProceedNext),
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
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Color(0xff1c9cfc), Color(0xff4cdfff)],
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
              color: Color(0xffafbed5),
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
            color: Color(0xffffbf3a),
          ),
          child: Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1)),
    );
  }
}
