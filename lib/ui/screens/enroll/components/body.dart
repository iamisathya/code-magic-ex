import 'package:code_magic_ex/ui/screens/enroll/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';

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
                  ctlr: controller.enrollIdController, label: "Enroller ID"),
              _renderTextField(
                ctlr: controller.sponsorIdController,
                label: "Sponosr ID",
              ),
              _renderSubmitButton(
                  label: controller.enrollerSponsorVerifyButton.value,
                  onPress: () => controller.verifyEnrollerSponsor()),
              if (controller.isEnrollerIdSuccess.value == true)
                Column(children: [
                  _renderInformationHeader(),
                  _renderTextField(
                      ctlr: controller.idCardNumberController,
                      label: "ID Card Number"),
                  _renderSubmitButton(
                      label: controller.govtIdVerifyButton.value,
                      onPress: () => controller.verifyGovtIdNumber()),
                ]),
                const SizedBox(height: 30),
              if (controller.isGovtIdSuccess.value == true)
                Column(
                  children: [
                    _renderTextField(
                        ctlr: controller.firstNameThController,
                        label: "First Name(Thai)"),
                    _renderTextField(
                        ctlr: controller.lastNameThController,
                        label: "Last Name(Thai)"),
                    _renderTextField(
                        ctlr: controller.firstNameEnController,
                        label: "First Name(En)"),
                    _renderTextField(
                        ctlr: controller.lastNameEnController,
                        label: "Last Name(En)"),
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
                    _renderDatePicker("Birth Day", context),
                    Obx(() => controller.isUnderAgeLimit.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                                "Applicant must be 18 years or older. (DD/MM/YYYY)",
                                style:
                                    Theme.of(context).textTheme.cardItemTitle),
                          )
                        : const SizedBox()),
                    _renderDropdownButton(
                        label: "Gender",
                        top: 10,
                        selectedValue: controller.userGender.value,
                        items: controller.genderDropdownItems,
                        onChanged: (String val) =>
                            controller.userGender.value = val),
                    _renderDropdownButton(
                        label: "Choose Province",
                        top: 10,
                        selectedValue: controller.provience.value,
                        items: controller.provinceDropdownItems,
                        onChanged: (String val) {
                          controller.provience.value = val;
                          controller.getAmphuresByProvince();
                        }),
                    _renderTextField(
                        ctlr: controller.mainAddressController,
                        label: "Address"),
                    _renderDropdownButton(
                        label: "Area",
                        top: 10,
                        selectedValue: controller.area.value,
                        items: controller.areaDropdownItems,
                        onChanged: (String val) {
                          controller.area.value = val;
                          controller.getDistrictsByAmphur();
                        }),
                    _renderDropdownButton(
                        label: "Sub-Area",
                        top: 10,
                        selectedValue: controller.subArea.value,
                        items: controller.subAreaDropdownItems,
                        onChanged: (String val) {
                          controller.subArea.value = val;
                          controller.getZipcodeByDistricts();
                        }),
                    _renderDropdownButton(
                        label: "Country",
                        top: 10,
                        selectedValue: controller.country.value,
                        items: controller.countryDropdownItems,
                        onChanged: (String val) =>
                            controller.userGender.value = val),
                    _renderTextField(
                        ctlr: controller.lastNameEnController,
                        label: "Zip code",
                        enabled: false),
                    _renderTextField(
                        ctlr: controller.emailAddressController,
                        label: "Email"),
                    _renderTextField(
                        ctlr: controller.phoneNumberController,
                        helperText: "* Please enter phone Thailand Only",
                        label: "Phone"),
                    _renderTextField(
                        ctlr: controller.mobileNumberController,
                        helperText: "* Please enter mobile phone Thailand Only",
                        label: "Mobile"),
                    const SizedBox(height: 30),
                    _renderSubmitButton(
                        label: "Verify All",
                        onPress: () => controller.verifyEnrollForm()),
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
          border: Border.all(width: 2, color: kMainColor),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.person_outline_outlined, size: 30, color: kMainColor),
          Text("Information", style: TextStyle(color: kMainColor))
        ],
      ),
    );
  }

  Container _renderInfoMessage() {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const [
            Icon(
              Icons.warning,
              color: Colors.red,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                    "Please contact Unicity if you experience any problems with this application or if you have any questions",
                    style: TextStyle(color: Colors.red)),
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
              cursorColor: kMainColor,
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
                  backgroundColor: MaterialStateProperty.all(kMainColor),
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
              onTap: () {
                DatePicker.showDatePicker(context,
                    onConfirm: (date) => controller.onChangeBirthDay(date));
              },
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
        padding: const EdgeInsets.all(4.0),
        child:
            Text(text, style: const TextStyle(color: Colors.red, fontSize: 16)),
      );
}
