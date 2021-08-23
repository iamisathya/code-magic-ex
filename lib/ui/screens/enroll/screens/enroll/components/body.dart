import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../styles/input_decorations.dart';
import '../../../bloc/bloc.dart';

class Body extends StatelessWidget {
  final EnrollController controller = Get.put(EnrollController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            children: [
              _renderInfoMessage(),
              _renderTextField(
                  ctlr: controller.enrollIdController, label: "enroller".tr),
              _renderTextField(
                ctlr: controller.sponsorIdController,
                label: "sponsor".tr,
              ),
              _renderSubmitButton(
                  label: controller.enrollerSponsorVerifyButton.value,
                  onPress: () => controller.verifyEnrollerSponsor(context)),
              if (controller.isEnrollerIdSuccess.value == true)
                Column(children: [
                  _renderInformationHeader(),
                  _renderTextField(
                      ctlr: controller.idCardNumberController,
                      label: "id_card".tr),
                  _renderSubmitButton(
                      label: controller.govtIdVerifyButton.value,
                      onPress: () => controller.verifyGovtIdNumber(context)),
                ]),
              const SizedBox(height: 30),
              if (controller.isGovtIdSuccess.value == true)
                Column(
                  children: [
                    _renderTextField(
                        ctlr: controller.firstNameThController,
                        label: "first_name_th".tr),
                    _renderTextField(
                        ctlr: controller.lastNameThController,
                        label: "last_name_th".tr),
                    _renderTextField(
                        ctlr: controller.firstNameEnController,
                        label: "first_name_en".tr),
                    _renderTextField(
                        ctlr: controller.lastNameEnController,
                        label: "last_name_en".tr),
                    Obx(() => _renderDropdownButton(
                        label: "Gender",
                        top: 10,
                        selectedValue: controller.userGender.value,
                        items: controller.genderDropdownItems,
                        onChanged: (String val) =>
                            controller.userGender.value = val)),
                    Obx(() => _renderDropdownButton(
                        label: "Marital Status",
                        top: 10,
                        selectedValue: controller.maritalStatus.value,
                        items: controller.statusDropdownItems,
                        onChanged: (String val) =>
                            controller.maritalStatus.value = val)),
                    _renderDatePicker("birth_day".tr, context),
                    Obx(() => controller.isUnderAgeLimit.value
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: Text(
                                "years20".tr),
                          )
                        : const SizedBox()),
                    _renderDropdownButton(
                        label: "province".tr,
                        top: 10,
                        selectedValue: controller.provience.value,
                        items: controller.provinceDropdownItems,
                        onChanged: (String val) =>
                            controller.onProvienceChange(val)),
                    _renderTextField(
                        ctlr: controller.mainAddressController,
                        label: "address1".tr),
                    _renderDropdownButton(
                        label: "area".tr,
                        top: 10,
                        selectedValue: controller.area.value,
                        items: controller.areaDropdownItems,
                        onChanged: (String val) =>
                            controller.onAreaChange(val)),
                    _renderDropdownButton(
                        label: "sub_area".tr,
                        top: 10,
                        selectedValue: controller.subArea.value,
                        items: controller.subAreaDropdownItems,
                        onChanged: (String val) =>
                            controller.onSubAreaChange(val)),
                    _renderDropdownButton(
                        label: "country".tr,
                        top: 10,
                        selectedValue: controller.country.value,
                        items: controller.countryDropdownItems,
                        onChanged: (String val) =>
                            controller.country.value = val),
                    _renderTextField(
                        ctlr: controller.zipCodeController,
                        label: "zip".tr,
                        enabled: false),
                    _renderTextField(
                        ctlr: controller.emailAddressController,
                        label: "email".tr),
                    _renderTextField(
                        ctlr: controller.phoneNumberController,
                        helperText: "* pleasephone".tr,
                        label: "phone".tr),
                    _renderTextField(
                        ctlr: controller.mobileNumberController,
                        helperText: "* pleasephone".tr,
                        label: "mobilephone".tr),
                    const SizedBox(height: 30),
                    _renderSubmitButton(
                        label: "verify_all".tr,
                        onPress: () => controller.verifyEnrollForm(context)),
                    if (controller.errorMessages.isNotEmpty) _renderErrorBox(),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Container _renderInformationHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Theme.of(Get.context!).colorScheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_outline_outlined,
              size: 30, color: Theme.of(Get.context!).colorScheme.primary),
          Text("Information",
              style:
                  TextStyle(color: Theme.of(Get.context!).colorScheme.primary))
        ],
      ),
    );
  }

  Container _renderInfoMessage() {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                    "more_info".tr,
                    style: const TextStyle(color: Colors.red)),
              ),
            )
          ],
        ));
  }

  Container _renderTextField(
      {TextEditingController? ctlr,
      bool enabled = true,
      String label = "",
      String helperText = ""}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _renderLabel(label),
          TextField(
              enabled: enabled,
              controller: ctlr,
              style: const TextStyle(fontSize: 18),
              cursorColor: Theme.of(Get.context!).colorScheme.primary,
              decoration: kTextInputDecoration(helperText: helperText))
        ],
      ),
    );
  }

  Container _renderSubmitButton(
      {required String label, required Function onPress}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
          width: Get.width,
          height: 55,
          child: ElevatedButton(
              onPressed: () {
                onPress();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ))),
              child: Text(label))),
    );
  }

  Container _renderDatePicker(String label, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(children: <Widget>[
        _renderLabel(label),
        Container(
            margin: const EdgeInsets.only(right: 4),
            child: TextField(
              controller: controller.birthDateController,
              readOnly: true,
              onTap: () => controller.renderDatePicker(context),
              decoration: kTextInputDecoration(hintText: "D.O.B"),
            )),
      ]),
    );
  }

  Container _renderDropdownButton(
      {required String label,
      required String selectedValue,
      required List<DropdownMenuItem<String>> items,
      required Function onChanged,
      required double top}) {
    return Container(
        margin: EdgeInsets.only(top: top),
        child: Column(children: <Widget>[
          _renderLabel(label),
          InputDecorator(
            decoration: kTextInputDecoration(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isDense: true,
                isExpanded: true,
                items: items,
                //controller.genderDropdownItems
                onChanged: (val) => onChanged(val),
              ),
            ),
          )
        ]));
  }

  Padding _renderLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8),
      child: SizedBox(
        width: Get.width,
        child: Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Container _renderErrorBox() {
    return Container(
        margin: const EdgeInsets.only(top: 24, bottom: 24),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.red.shade50,
            border: Border.all(width: 2, color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: controller.errorMessages
                .map((errorMsg) => _errorText(errorMsg))
                .toList(),
          ),
        ));
  }

  Padding _errorText(String text) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 16)),
      );
}
