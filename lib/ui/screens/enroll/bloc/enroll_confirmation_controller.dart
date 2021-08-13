import 'dart:convert';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/enroll_form.dart';
import 'package:code_magic_ex/models/enroll_log_request_data.dart';
import 'package:code_magic_ex/models/enrollee_user_data.dart';
import 'package:code_magic_ex/models/general_models.dart';
import 'package:code_magic_ex/models/place_order.dart'
    hide
        Customer,
        HumanName,
        TaxTerms,
        ProductLines,
        ShipToName,
        ProductTerms,
        Transactions;
import 'package:code_magic_ex/models/user_info.dart'
    hide HumanName, MainAddress, TaxTerms;
import 'package:code_magic_ex/ui/global/widgets/overlay_progress.dart';
import 'package:code_magic_ex/ui/screens/enroll/screens/order_complete/enroll_complete.dart';
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          campaign: "",
          agent: "MLBS-DSCTools-TH",
          medium: "Internet",
          platform: kCurrentOS,
          referrer: "",
          version: "");
      final UserInfo usedInfo = UserSessionManager.shared.userInfo!;
      final ProductLineItem checkoutItems = ProductLineItem(
          quantity: "1",
          item: CustomerHref(
              href: "https://hydra.unicity.net/v5a/items?id.unicity=20817"));

      final EnrollLogRequestData requestData = EnrollLogRequestData(
          customer: Customer(
              href:
                  "https://hydra.unicity.net/v5a/customers?unicity=${usedInfo.id.unicity.toString()}",
              birthDate: enroleeData.dateOfBirth,
              email: enroleeData.email,
              enroller: CustomerHref(href: "https://hydra.unicity.net/v5a/customers?id.unicity=${enroleeData.enrollerId}"),
              entryPeriod: getCurrentPeriod(),
              gender: enroleeData.gender,
              homePhone: enroleeData.phoneNumber,
              humanName: HumanName(
                  firstName: usedInfo.humanName.firstName,
                  lastName: usedInfo.humanName.lastName,
                  firstNameTh: usedInfo.humanName.fullNameTh,
                  lastNameTh: usedInfo.humanName.fullNameTh),
              mainAddress: MainAddress(
                  address1: usedInfo.mainAddress.address1,
                  address2: usedInfo.mainAddress.address2,
                  city: usedInfo.mainAddress.city,
                  country: usedInfo.mainAddress.country,
                  state: usedInfo.mainAddress.state,
                  zip: usedInfo.mainAddress.zip),
              maritalStatus: enroleeData.maritalStatus,
              mobilePhone: enroleeData.mobileNumber,
              password: Password(value: enroleeData.password),
              source: source,
              sponsor: CustomerHref(href: "https://hydra.unicity.net/v5a/customers?id.unicity=${enroleeData.sponsorId}"),
              taxTerms: TaxTerms(taxId: enroleeData.taxId),
              type: 'Associate'),
          lines: ProductLines(items: [checkoutItems]),
          shipToAddress: UserShipToAddress(
              city: usedInfo.mainAddress.city,
              state: usedInfo.mainAddress.state,
              address1: usedInfo.mainAddress.address1,
              zip: usedInfo.mainAddress.zip,
              country: "TH",
              address2: usedInfo.mainAddress.address2),
          shipToEmail:
              usedInfo.email.isNotEmpty ? usedInfo.email : "none@unicity.com",
          shipToName: ShipToName(
              firstName: usedInfo.humanName.firstName,
              lastName: usedInfo.humanName.lastName),
          shipToPhone: usedInfo.homePhone,
          shippingMethod: CustomerHref(
              href:
                  "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"),
          notes: prepareNotes(usedInfo.id.unicity.toString(), "TH"),
          terms: ProductTerms(period: getCurrentPeriod()),
          transactions: Transactions(items: [
            TransactionItem(
                amount: 6000.toString(), method: "Cash", type: "record")
          ]),
          source: source);
      return requestData;
    } catch (err) {
      LoggerService.instance.e(err.toString());
      return null;
    }
  }

  Future<void> getPurchaseLog(BuildContext context) async {
    try {
      _sendingMsgProgressBar.show(context);
      final bool serverStatus = await checkOrderEntryServerStatus();
      if(!serverStatus) {
        renderErrorSnackBar(title: "Server error!", subTitle: "Server was down, please try again later!");
        _sendingMsgProgressBar.hide();
        return;
      }
      final payload = prepareRequestPaylod();
      if (payload == null) {
        throw Exception(
            'Somthing went wrong while preparing PurchaseLogRequestData');
      }
      final String jsonUser = jsonEncode(prepareRequestPaylod());
      await MemberCallsService.init().logEnrollerData(
        kEnrollerLog,
        jsonUser,
      );
      _sendingMsgProgressBar.hide();
    } catch (err) {
      _sendingMsgProgressBar.hide();
      LoggerService.instance.e(err.toString());
    }
  }

  Future<PlaceOrder?> proceedPlaceOrder(BuildContext context) async {
    PlaceOrder? response;
    try {
      final String enrollResponse = jsonEncode(prepareRequestPaylod());
      response = await ApiService.shared().getPlaceOrders(enrollResponse);
      if (response.taxedAs != "") {
        // * firing all api's at once
        // await verifyOrder(response);
      }
      return response;
    } on DioError catch (e) {
      LoggerService.instance.e(e.toString());
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
      return response;
    } catch (err) {
      LoggerService.instance.e(err.toString());
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
      return response;
    }
  }

  Future<void> verifyOrder() async {
    final EnrollForm placeOrde = EnrollForm.fromJson({"market":"TH","notes":"enrollment|dsc|pc web|tha||108357166|","shippingMethod":{"type":"WillCall","warehouseUUID":"9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c","location":"__warehouseLink"},"shipToAddress":{"country":"TH","state":"","city":"26","zip":"","address1":"Main address ","address2":"\n                                Sub-Area\n                                บุ่ง   \n                                    Area\n                                เมืองอำนาจเจริญ   "},"shipToEmail":"test@unicity.com","shipToName":{"firstName":"Test","lastName":"data"},"shipToPhone":"990099009","shipToTime":null,"source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null},"type":null,"lines":{"items":[{"quantity":1,"item":{"href":"https://hydra.unicity.net/v5a/items?id.unicity=20817","id":{"unicity":"20817"}}}]},"transactions":{"items":null},"terms":{"discount":{"amount":0},"freight":{"amount":0},"period":"2021-08","pv":0,"subtotal":500,"tax":{"amount":32.71},"taxableTotal":467.29,"total":500},"dateCreated":"2021-08-12T01:25:19-06:00","currency":"THB","giftReceipt":false,"customer":{"mainAddress":{"city":"อำนาจเจริญ   ","country":"TH","state":"","zip":"37000","address1":"Main address ","address2":"\n                                Sub-Area\n                                บุ่ง   \n                                    Area\n                                เมืองอำนาจเจริญ   "},"humanName":{"firstName":"Test","lastName":"Data","firstName@th":"ทดสอบ","lastName@th":"ข้อมูล"},"enroller":{"href":"https://hydra.unicity.net/v5a/customers/88c4ee710dc1e71b881b0027f274e4231cd9208e76ad8a7e04ef0182f2740c85","id":{"unicity":108357166}},"sponsor":{"href":"https://hydra.unicity.net/v5a/customers/88c4ee710dc1e71b881b0027f274e4231cd9208e76ad8a7e04ef0182f2740c85","id":{"unicity":108357166}},"birthDate":"2003-02-01","maritalStatus":"Single","email":"test@unicity.com","taxTerms":{"taxId":"4784673972810"},"homePhone":"990099009","mobilePhone":"9900990099","entryPeriod":"2021-08","gender":"male","password":{"value":"4784673972810"},"type":"Associate","source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null},"businessEntity":{"legalType":"SoleProprietorship"},"status":"Active","id":{"unicity":"257461866"},"href":"https://hydra.unicity.net/v5a/customers/753929fdad523b9d23946870e95341456785d1c0fd9183deaa502140775c9d1a","token":"30efe38e-2415-4744-8d6c-f5038bdab71f"},"id":{"unicity":"66-423162108"},"href":"https://hydra.unicity.net/v5a/orders/31512d2a1d4a2a5860bc785d27d1f752403820d10bb098e46ca6c14da9a04e8a"});
    try {
      await MemberCallsService.init().verifyEnrollOrder(placeOrde);
      await forceResetPassword();
      Get.offNamedUntil(EnrollComplete.routeName, ModalRoute.withName('/enrollHome'));
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
    }
  }

  Future<void> forceResetPassword() async {
    try {
      final PasswordResetResponse validationResponse = await MemberCalls2Service.init().forceResetPassword("257461866",);
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
