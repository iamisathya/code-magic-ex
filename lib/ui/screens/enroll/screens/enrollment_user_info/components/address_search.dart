import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../open_po/home/components/loader.dart';
import '../controller/enrollment.userinfo.controller.dart';

class AddressSearchModal extends StatelessWidget {
  AddressSearchModal({Key? key}) : super(key: key);

  final EnrollmentUserInfoController controller =
      Get.put(EnrollmentUserInfoController());

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        mode: Mode.BOTTOM_SHEET,
        popupSafeArea: const PopupSafeArea(),
        showSearchBox: true,
        showSelectedItem: true,
        clearButton: const Icon(Icons.clear),
        showClearButton: true,
        emptyBuilder: (BuildContext ctx, String? emprty) {
          return const Center(child: Text("Sorry no results foun!"));
        },
        loadingBuilder: (BuildContext ctx, String? emprty) {
          return const Loader();
        },
        // onFind: (String filter) => controller.searchAddresByZipCode(filter),
        searchBoxDecoration: InputDecoration(
          fillColor: const Color(0xFFFFFFFF),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Color(0xFFD0D0CF), width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Color(0xFFD0D0CF), width: 0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Color(0xFFD0D0CF), width: 0.5),
          ),
          suffixIcon: const Icon(Icons.search),
        ),
        items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
        label: "Menu mode",
        hint: "country in menu mode",
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: "Brazil");
  }
}
