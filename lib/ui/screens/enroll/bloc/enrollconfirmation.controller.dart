import 'dart:convert';

import 'package:dsc_tools/models/user_info.dart'
    hide HumanName, MainAddress, TaxTerms;
import 'package:dsc_tools/ui/global/widgets/overlay_progress.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/order_complete/enrollcomplete.screen.dart';
import 'package:dsc_tools/utilities/logger.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/enroll_form.dart';
import '../../../../models/enroll_log_request_data.dart';
import '../../../../models/enrollee_user_data.dart';
import '../../../../models/general_models.dart';

class EnrollConfirmationController extends GetxController {
  late EnrolleeUserData enroleeData;

  final ProgressBar _sendingMsgProgressBar = ProgressBar();

  @override
  void onInit() {
    super.onInit();
    final dynamic data = Get.arguments;
    if (data != null) {
      enroleeData = data as EnrolleeUserData;
    }
  }

  void onCancel() {
    Get.back();
  }

  Future<void> proceedOrderPlace(BuildContext context) async {
    try {
      _sendingMsgProgressBar.show(context);
      final bool isServerRuning = await checkOrderEntryServerStatus();
      if (!isServerRuning) {
        renderErrorSnackBar(
            title: "Server error!",
            subTitle: "Server was down, please try again later!");
        _sendingMsgProgressBar.hide();
        return;
      }
      if (isServerRuning) {
        await getPurchaseLog();
        final EnrollForm? resposne = await proceedPlaceOrder();
        if (resposne != null) {
          verifyOrder(resposne);
          await forceResetPassword();
          Get.offNamedUntil(
              EnrollComplete.routeName, ModalRoute.withName('/enrollHome'),
              arguments: resposne);
        }
      }
      _sendingMsgProgressBar.hide();
    } catch (e) {
      _sendingMsgProgressBar.hide();
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
      renderErrorSnackBar(title: "Server Error!", subTitle: e.error.toString());
      return false;
    } catch (err) {
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return false;
    }
  }

  EnrollLogRequestData? prepareRequestPaylod() {
    try {
      final source = Source(
          campaign: null,
          agent: "MLBS-DSCTools-TH",
          medium: "Internet",
          platform: "Mac OS",
          referrer: null,
          version: null);
      final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
      final ProductLineItem checkoutItems = ProductLineItem(
          quantity: "1",
          item: CustomerHref(
              href: "https://hydra.unicity.net/v5a/items?id.unicity=20817"));

      final EnrollLogRequestData requestData = EnrollLogRequestData(
          customer: Customer(
              mainAddress: MainAddress(
                  address1: usedInfo.mainAddress.address1,
                  address2: usedInfo.mainAddress.address2,
                  city: usedInfo.mainAddress.city,
                  country: usedInfo.mainAddress.country,
                  state: usedInfo.mainAddress.state,
                  zip: usedInfo.mainAddress.zip),
              humanName: HumanName(
                  firstName: usedInfo.humanName.firstName,
                  lastName: usedInfo.humanName.lastName,
                  firstNameTh: usedInfo.humanName.fullNameTh ?? "",
                  lastNameTh: usedInfo.humanName.fullNameTh),
              enroller: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/customers?id.unicity=${enroleeData.enrollerId}"),
              sponsor: CustomerHref(
                  href:
                      "https://hydra.unicity.net/v5a/customers?id.unicity=${enroleeData.sponsorId}"),
              birthDate: enroleeData.dateOfBirth,
              maritalStatus: enroleeData.maritalStatus,
              email: enroleeData.email,
              taxTerms: TaxTerms(taxId: enroleeData.taxId),
              homePhone: enroleeData.phoneNumber,
              mobilePhone: enroleeData.mobileNumber,
              entryPeriod: getCurrentPeriod(),
              gender: enroleeData.gender,
              password: Password(value: enroleeData.password),
              type: 'Associate',
              source: source),
          lines: ProductLines(items: [checkoutItems]),
          shipToName: ShipToName(
              firstName: usedInfo.humanName.firstName,
              lastName: usedInfo.humanName.lastName),
          shipToPhone: usedInfo.homePhone,
          shipToEmail:
              usedInfo.email.isNotEmpty ? usedInfo.email : "none@unicity.com",
          notes: prepareNotes(usedInfo.id.unicity.toString(), "TH"),
          shipToAddress: UserShipToAddress(
              city: usedInfo.mainAddress.city,
              country: "TH",
              state: usedInfo.mainAddress.state,
              address1: usedInfo.mainAddress.address1,
              address2: usedInfo.mainAddress.address2,
              zip: usedInfo.mainAddress.zip),
          shippingMethod: CustomerHref(
              href:
                  "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"),
          transactions: Transactions(items: [
            TransactionItem(
                amount: "this.terms.total", method: "Cash", type: "record")
          ]),
          terms: ProductTerms(period: getCurrentPeriod()),
          source: source);
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
        _sendingMsgProgressBar.hide();
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
