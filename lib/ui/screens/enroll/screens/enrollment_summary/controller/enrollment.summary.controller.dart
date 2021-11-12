import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrolment_complete/main_screen.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class EnrollmentSummaryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CartProductsItem> cartProducts = <CartProductsItem>[].obs;

  late Rx<PaymentOptions> activePayType = PaymentOptions.none.obs;

  set currentPaymentType(PaymentOptions option) => activePayType.value = option;
  PaymentOptions get currentPaymentType => activePayType.value;

  // credit card controller
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expireDayController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  void selectExpiryDate(BuildContext context) {
    DateTime? selectedDate;
    if (expireDayController.text != "") {
      final selcted = DateFormat("yyyy-MM-dd").parse(expireDayController.text);
      selectedDate = DateTime(selcted.year, selcted.month, selcted.day);
    }
    DatePicker.showDatePicker(context,
        minTime: DateTime.now(),
        currentTime: selectedDate,
        onConfirm: (date) => onChangeBirthDay(date));
  }

  void onChangeBirthDay(DateTime date) {
    final String selectedDate = DateFormat('yyyy-MM-dd').format(date);
    expireDayController.text = selectedDate.toString();
  }

  void onProceedPayment() {
    Get.to(() => EnrollmentCompleteScreen());
  }
}
