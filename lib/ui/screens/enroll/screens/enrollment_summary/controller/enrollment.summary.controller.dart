import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsc_tools/api/api_address.dart';
import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/user_info.dart'
    hide HumanName, MainAddress, TaxTerms;
import 'package:dsc_tools/ui/screens/enroll/controllers/enroll.controller.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrolment_complete/main_screen.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/snackbar.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../../../api/config/api_service.dart';
import '../../../../../../models/cart_products.dart';
import '../../../../../../models/enroll_form.dart';
import '../../../../../../models/enroll_log_request_data.dart';
import '../../../../../../models/enrollee_user_data.dart';
import '../../../../../../models/general_models.dart';
import '../../../../../../../utilities/extensions.dart';

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

  final EnrollHomeController enrollHomeController =
      Get.put(EnrollHomeController());

  late EnrolleeUserData enrolleeUserData;

  @override
  void onInit() {
    super.onInit();
    final EnrolleeUserData data = Get.arguments as EnrolleeUserData;
    if (data.firstName.isNotEmpty) {
      enrolleeUserData = data;
    } else {
      Get.back();
    }
  }

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

  Future<void> proceedOrderPlace() async {
    try {
      isLoading.toggle();
      final bool isServerRuning = await checkOrderEntryServerStatus();
      if (!isServerRuning) {
        SnackbarUtil.showError(
            message: "Server error! please try again later!");
        isLoading.toggle();
        return;
      }
      if (isServerRuning) {
        await getPurchaseLog();
        final EnrollForm? resposne = await proceedPlaceOrder();
        if (resposne != null) {
          verifyOrder(resposne);
          await forceResetPassword();
          // Get.offNamedUntil(EnrollmentCompleteScreen.routeName,
          //     ModalRoute.withName('/enrollmentCompleteHomePage'),
          //     arguments: resposne);

          final args = OrderCompleteArguments(
              orderId: resposne.id.unicity.retrieveOrderId(),
              orderStatus: true,
              userId: resposne.customer.id.unicity);
          Get.to(EnrollmentCompleteScreen(), arguments: args);
        } else {
          final args = OrderCompleteArguments(
              orderId: "", orderStatus: false, userId: "");
          Get.to(EnrollmentCompleteScreen(), arguments: args);
        }
      }
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      LoggerService.instance.e(e.toString());
    }
  }

  Future<bool> checkOrderEntryServerStatus() async {
    try {
      final String status = await MemberCallsService.init()
          .checkOrderEntryStatus(kCheckOrderEntryServerStatus);
      if (status == "on") {
        return true;
      }
      return false;
    } on DioError catch (e) {
      SnackbarUtil.showError(message: "Server Error! ${e.error.toString()}");
      return false;
    } catch (err) {
      SnackbarUtil.showError(message: "Error! ${err.toString()}");
      return false;
    }
  }

  List<ProductLineItem> checkoutItems() {
    return enrollHomeController.cartProducts
        .map((element) => ProductLineItem(
            item: CustomerHref(
                href:
                    "https://hydra.unicity.net/v5a/items?id.unicity=${element.itemCode}"),
            quantity: element.quantity.toString()))
        .toList();
  }

  Future<Source> prepareSource() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return Source(
        campaign: null,
        agent: "MLBS-DSCTools-TH",
        medium: "Internet",
        platform: "${Globals.deviceType} ${Globals.osVersion}",
        referrer: "Sales",
        version:
            "v-${packageInfo.version} : build_number-${packageInfo.buildNumber}");
  }

  Future<EnrollLogRequestData?> prepareRequestPaylod() async {
    try {
      final EnrollLogRequestData requestData = EnrollLogRequestData(
          customer: Customer(
              mainAddress: MainAddress(
                  address1: enrolleeUserData.mainAddress1,
                  address2: enrolleeUserData.mainAddress2,
                  city: enrolleeUserData.city,
                  country: enrolleeUserData.country,
                  state: enrolleeUserData.city,
                  zip: enrolleeUserData.zipCode),
              humanName: HumanName(
                  firstName: enrolleeUserData.firstName,
                  lastName: enrolleeUserData.lastName,
                  firstNameTh: enrolleeUserData.firstNameTh,
                  lastNameTh: enrolleeUserData.lastNameTh),
              enroller: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/customers?id.unicity=${enrolleeUserData.enrollerId}"),
              sponsor: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/customers?id.unicity=${enrolleeUserData.sponsorId}"),
              birthDate: enrolleeUserData.dateOfBirth,
              maritalStatus: enrolleeUserData.maritalStatus,
              email: enrolleeUserData.email,
              taxTerms: TaxTerms(taxId: enrolleeUserData.taxId),
              homePhone: enrolleeUserData.phoneNumber,
              mobilePhone: enrolleeUserData.mobileNumber,
              entryPeriod: getCurrentPeriod(),
              gender: enrolleeUserData.gender,
              password: Password(value: enrolleeUserData.password),
              type: 'Associate',
              source: await prepareSource()),
          lines: ProductLines(items: checkoutItems()),
          shipToName: ShipToName(
              firstName: enrolleeUserData.firstName,
              lastName: enrolleeUserData.lastName),
          shipToPhone: enrolleeUserData.phoneNumber,
          shipToEmail: enrolleeUserData.email,
          notes: prepareNotes(
              enrolleeUserData.enrollerId, enrolleeUserData.country),
          shipToAddress: UserShipToAddress(
              city: enrolleeUserData.city,
              country: enrolleeUserData.country,
              state: enrolleeUserData.city,
              address1: enrolleeUserData.mainAddress1,
              address2: enrolleeUserData.mainAddress2,
              zip: enrolleeUserData.zipCode),
          shippingMethod: CustomerHref(href: Address.deliveryShiping),
          transactions: Transactions(items: [
            TransactionItem(
                amount: "this.terms.total", method: "Cash", type: "record")
          ]),
          terms: ProductTerms(period: getCurrentPeriod()),
          source: await prepareSource());
      return requestData;
    } catch (err) {
      LoggerService.instance.e(err.toString());
      return null;
    }
  }

  Future<void> getPurchaseLog() async {
    try {
      final payload = prepareRequestPaylod();
      if (payload == null) {
        isLoading.toggle();
        throw Exception(
            'Somthing went wrong while preparing PurchaseLogRequestData');
      }
      final String jsonUser = jsonEncode(prepareRequestPaylod());
      await MemberCallsService.init().logEnrollerData(
        kEnrollerLog,
        jsonUser,
      );
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }

  Future<EnrollForm?> proceedPlaceOrder() async {
    EnrollForm? response;
    try {
      final String enrollResponse = jsonEncode(prepareRequestPaylod());
      response = await ApiService.shared().placeEnrollOrder(enrollResponse);
      if (response.customer.id.unicity != "") {
        // * firing all api's at once
        return response;
      }
      return null;
    } on DioError catch (e) {
      LoggerService.instance.e(e.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      return null;
    } catch (err) {
      LoggerService.instance.e(err.toString());
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return null;
    }
  }

  Future<void> verifyOrder(EnrollForm placeOrde) async {
    // final EnrollForm placeOrde = EnrollForm.fromJson({"market":"TH","notes":"enrollment|dsc|pc web|tha||108357166|","shippingMethod":{"type":"WillCall","warehouseUUID":"9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c","location":"__warehouseLink"},"shipToAddress":{"country":"TH","state":"","city":"26","zip":"","address1":"Main address ","address2":"\n                                Sub-Area\n                                บุ่ง   \n                                    Area\n                                เมืองอำนาจเจริญ   "},"shipToEmail":"test@unicity.com","shipToName":{"firstName":"Test","lastName":"data"},"shipToPhone":"990099009","shipToTime":null,"source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null},"type":null,"lines":{"items":[{"quantity":1,"item":{"href":"https://hydra.unicity.net/v5a/items?id.unicity=20817","id":{"unicity":"20817"}}}]},"transactions":{"items":null},"terms":{"discount":{"amount":0},"freight":{"amount":0},"period":"2021-08","pv":0,"subtotal":500,"tax":{"amount":32.71},"taxableTotal":467.29,"total":500},"dateCreated":"2021-08-12T01:25:19-06:00","currency":"THB","giftReceipt":false,"customer":{"mainAddress":{"city":"อำนาจเจริญ   ","country":"TH","state":"","zip":"37000","address1":"Main address ","address2":"\n                                Sub-Area\n                                บุ่ง   \n                                    Area\n                                เมืองอำนาจเจริญ   "},"humanName":{"firstName":"Test","lastName":"Data","firstName@th":"ทดสอบ","lastName@th":"ข้อมูล"},"enroller":{"href":"https://hydra.unicity.net/v5a/customers/88c4ee710dc1e71b881b0027f274e4231cd9208e76ad8a7e04ef0182f2740c85","id":{"unicity":108357166}},"sponsor":{"href":"https://hydra.unicity.net/v5a/customers/88c4ee710dc1e71b881b0027f274e4231cd9208e76ad8a7e04ef0182f2740c85","id":{"unicity":108357166}},"birthDate":"2003-02-01","maritalStatus":"Single","email":"test@unicity.com","taxTerms":{"taxId":"4784673972810"},"homePhone":"990099009","mobilePhone":"9900990099","entryPeriod":"2021-08","gender":"male","password":{"value":"4784673972810"},"type":"Associate","source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null},"businessEntity":{"legalType":"SoleProprietorship"},"status":"Active","id":{"unicity":"257461866"},"href":"https://hydra.unicity.net/v5a/customers/753929fdad523b9d23946870e95341456785d1c0fd9183deaa502140775c9d1a","token":"30efe38e-2415-4744-8d6c-f5038bdab71f"},"id":{"unicity":"66-423162108"},"href":"https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f752403820d10bb098e46ca6c14da9a04e8a"});
    try {
      await MemberCallsService.init().verifyEnrollOrder(placeOrde);
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
    }
  }

  Future<void> forceResetPassword() async {
    try {
      final PasswordResetResponse validationResponse =
          await MemberCalls2Service.init().forceResetPassword(
        "257461866",
      );
      if (validationResponse.affectedRows == 1) {
        debugPrint("Password reset success");
      }
    } on DioError catch (e) {
      LoggerService.instance.e(e.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
    }
  }
}
