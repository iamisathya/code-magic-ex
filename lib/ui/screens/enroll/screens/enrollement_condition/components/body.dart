import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../inventory/component/page_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? found = termsAndConditions.firstWhereOrNull((market) =>
        market["countryCode"] == Globals.countryCode);
    final List<String> tems = found == null ? [] : found["content"][Globals.defaultLanguage.toUpperCase() != "EN" ? "native" : "english"] as List<String>;
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          const PageTitle(title: "Terms & conditions"),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tems
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: AppText(text: e, style: TextTypes.bodyText1),
                        ))
                    .toList()),
          ),
        ],
      )),
    );
  }
}
