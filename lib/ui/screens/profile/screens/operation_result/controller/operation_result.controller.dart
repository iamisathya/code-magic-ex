import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OperationResultController extends GetxController {
  final Rx<OperationrResultModel> result = const OperationrResultModel().obs;
  @override
  void onInit() {
    _onRecieveArgs();
    super.onInit();
  }

  void _onRecieveArgs() {
    try {
      final dynamic data = Get.arguments;
      if (data != null) {
        result.value = data as OperationrResultModel;
      }
    } catch (e, stack) {
      LoggerService.instance.e(e, stack);
    }
  }
}

class OperationrResultModel {
  const OperationrResultModel(
      {this.headerText = '',
      this.title = '',
      this.message = '',
      this.subContent = '',
      this.buttonText = '',
      this.resultImage = kOrderSuccessImage,
      this.onPressDone});

  final String headerText;
  final String title;
  final String message;
  final String subContent;
  final String buttonText;
  final String resultImage;
  final VoidCallback? onPressDone;
}
