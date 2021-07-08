import 'dart:math';

import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void renderErrorSnackBar({String title = "", String subTitle = ""}) {
  return Get.snackbar(
    title,
    subTitle,
    titleText:
        Text(title, style: const TextStyle(color: kPrimaryColor, fontSize: 16)),
    messageText: Text(subTitle,
        style: const TextStyle(color: kPrimaryColor, fontSize: 14)),
    backgroundColor: Colors.white,
    borderColor: kPrimaryLightColor,
    animationDuration: const Duration(milliseconds: 300),
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10.0,
    borderWidth: 2,
    icon: const Icon(
      Icons.error_outline,
      color: kPrimaryColor,
    ),
  );
}

String calculateTotalAmount({required String quantity, required double price}) {
  try {
    return (double.parse(quantity) * price).toInt().toString();
  } catch (e) {
    return price.toString();
  }
}

String calculateTotalPrice(InventoryRecords inventoryRecords, String type) {
  double total = 0.0;
  // looping over data array
  for (final item in inventoryRecords.items) {
    total += Parsing.intFrom(item.quantityOnHand)! *
        (type == "pv" ? item.terms.pvEach : item.terms.priceEach);
  }
  return total.toInt().toString();
}

String generateRandomString(int length) {
  const _chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  final Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
