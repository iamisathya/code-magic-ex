import 'package:dsc_tools/models/cart_products.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
}