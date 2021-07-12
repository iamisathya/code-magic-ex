import 'package:code_magic_ex/ui/screens/enroll/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:code_magic_ex/utilities/extensions.dart';

class Body extends StatelessWidget {
  final EnrollController controller = Get.put(EnrollController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPageBackground,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              _renderInfoMessage(),
              _renderTextField(
                  ctlr: controller.enrollIdController,
                  label: "Enroller ID"),
              _renderTextField(
                  ctlr: controller.sponsorIdController,
                  label: "Sponosr ID",),
              _renderSubmitButton(
                  label: "Verify Enroller",
                  onPress: () => controller.verifyEnrollerSponsor()),
              _renderTextField(
                  ctlr: controller.idCardNumberController,
                  label: "ID Card Number"),
              _renderSubmitButton(
                  label: "Verify ID",
                  onPress: () => controller.verifyGovtIdNumber()),
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
                  selectedValue: controller.userGender.value,
                  items: controller.genderDropdownItems,
                  onChanged: (String val) => controller.userGender = val.obs)),
              Obx(() => _renderDropdownButton(
                  label: "Marital Status",
                  selectedValue: controller.maritalStatus.value,
                  items: controller.statusDropdownItems,
                  onChanged: (String val) =>
                      controller.maritalStatus = val.obs)),
              _renderDatePicker("Birth Day", context),
              Obx(() => controller.isUnderAgeLimit.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                          "Applicant must be 18 years or older. (DD/MM/YYYY)",
                          style: Theme.of(context).textTheme.cardItemTitle),
                    )
                  : const SizedBox()),
              Obx(() => _renderDropdownButton(
                  label: "Gender",
                  selectedValue: controller.userGender.value,
                  items: controller.genderDropdownItems,
                  onChanged: (String val) => controller.userGender = val.obs)),
              _renderSubmitButton(
                  label: "Verify Enroller",
                  onPress: () => controller.verifyEnrollerSponsor()),
              _renderDropdownButton(
                  label: "Choose Province",
                  selectedValue: controller.provience.value,
                  items: controller.provinceDropdownItems,
                  onChanged: (String val) => controller.userGender = val.obs),
              _renderTextField(
                  ctlr: controller.lastNameEnController,
                  label: "Address"),
              _renderDropdownButton(
                  label: "Area",
                  selectedValue: controller.area.value,
                  items: controller.areaDropdownItems,
                  onChanged: (String val) => controller.userGender = val.obs),
              _renderDropdownButton(
                  label: "Sub-Area",
                  selectedValue: controller.subArea.value,
                  items: controller.subAreaDropdownItems,
                  onChanged: (String val) => controller.userGender = val.obs),
              _renderDropdownButton(
                  label: "Country",
                  selectedValue: controller.country.value,
                  items: controller.countryDropdownItems,
                  onChanged: (String val) => controller.userGender = val.obs),
              _renderTextField(
                  ctlr: controller.lastNameEnController,
                  label: "Zip code",
                  enabled: false),
              _renderTextField(
                  ctlr: controller.lastNameEnController,
                  label: "Email"),
              _renderTextField(
                  ctlr: controller.lastNameEnController,
                  label: "Phone"),
              _renderTextField(
                  ctlr: controller.lastNameEnController,
                  label: "Mobile"),
              _renderSubmitButton(
                  label: "Verify All",
                  onPress: () => controller.verifyGovtIdNumber()),
            ],
          ),
        ),
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

  Container _renderTextField({TextEditingController? ctlr, bool enabled = true, String label = "", String helperText = ""}) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
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
      margin: const EdgeInsets.only(top: 30, bottom: 20),
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
              child: Obx(() => Text(controller.isSubmitting.value == true
                  ? "Verifying..."
                  : label)))),
    );
  }

  Container _renderDatePicker(String label, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
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
      required Function onChanged}) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(children: <Widget>[
          _renderLabel(label),
          InputDecorator(
            decoration: kTextInputDecoration(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.userGender.value,
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
}
