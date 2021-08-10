import 'dart:convert';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/enroll_log_request_data.dart';
import 'package:code_magic_ex/models/enrollee_user_data.dart';
import 'package:code_magic_ex/models/govt_id_verify.dart';
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
import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnrollConfirmationController extends GetxController {
  late EnrolleeUserData enroleeData;

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
              enroller: CustomerHref(href: ""),
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
              sponsor: CustomerHref(href: ""),
              taxTerms: TaxTerms(taxId: ''),
              type: ''),
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

  Future<void> getPurchaseLog(int periodLog) async {
    try {
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
    } catch (err) {
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
        await verifyOrder(response);
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

  Future<void> verifyOrder(PlaceOrder requestData) async {
    try {
      await MemberCallsService.init().verifyOrder(requestData);
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
    }
  }

  Future<void> enrollValidation(PlaceOrder requestData) async {
    try {
      final GovtIdVerify validationResponse = await MemberCallsService.init()
          .enrollValidation(
              "English",
              enroleeData.firstName,
              enroleeData.lastName,
              enroleeData.firstNameTh,
              enroleeData.lastNameTh,
              enroleeData.gender,
              enroleeData.maritalStatus,
              enroleeData.dateOfBirth,
              enroleeData.mainAddress,
              enroleeData.mainAddress,
              enroleeData.city,
              enroleeData.country,
              enroleeData.zipCode,
              enroleeData.email,
              enroleeData.mobileNumber,
              enroleeData.phoneNumber,
              enroleeData.password);
      if (validationResponse.success == "Yes") {
        debugPrint("Enrolll Success");
      }
    } on DioError catch (e) {
      renderErrorSnackBar(title: "Error!", subTitle: e.error.toString());
    } catch (err) {
      LoggerService.instance.e(err.toString());
      renderErrorSnackBar(title: "Error!", subTitle: err.toString());
    }
  }
}
