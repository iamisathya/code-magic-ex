import 'package:dropdown_search/dropdown_search.dart';
import 'package:dsc_tools/ui/screens/enroll/screens/enrollment_user_info/controller/enrollment.userinfo.controller.dart';
import 'package:dsc_tools/ui/screens/open_po/home/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressSearchModal extends StatelessWidget {
  AddressSearchModal({Key? key}) : super(key: key);

  final EnrollmentUserInfoController controller =
      Get.put(EnrollmentUserInfoController());

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<UserModel>(
        mode: Mode.BOTTOM_SHEET,
        popupSafeArea: const PopupSafeArea(),
        showSearchBox: true,
        showSelectedItem: true,
        clearButton: const Icon(Icons.clear),
        showClearButton: true,
        emptyBuilder: (BuildContext ctx, String? emprty) {
          return const Center(child: Text("Sorry no results found!"));
        },
        loadingBuilder: (BuildContext ctx, String? emprty) {
          return const Loader();
        },
        onFind: (String filter) => controller.searchAddresByZipCode(filter),
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

class UserModel {
  String? id;
  DateTime? createdAt;
  String? name;
  String? avatar;

  UserModel({this.id, this.createdAt, this.name, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    createdAt = json['createdAt'] as DateTime;
    name = json['name'] as String;
    avatar = json['avatar'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }

  static List<UserModel>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => UserModel.fromJson(item as Map<String, dynamic>)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel model) {
    return id == model.id;
  }

  @override
  String toString() => name!;
}
