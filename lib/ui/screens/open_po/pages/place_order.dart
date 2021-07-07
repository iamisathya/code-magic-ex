import 'package:code_magic_ex/ui/screens/open_po/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceOrderHomePage extends StatelessWidget {
  final SampleController controller = Get.put(SampleController());
  static const String routeName = '/placeOrderHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteSmokeColor,
        appBar: AppBar(
          title: const Text("PO List"),
        ),
        body: Container(
          child: Center(),
        ));
  }
}
