import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants.dart';
import '../../../controllers/main.controller.dart';

class SearchRadioOptions extends StatelessWidget {
  final OrderEntryController controller = Get.put(OrderEntryController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: controller.searchRadioOptions
          .map((data) => Obx(() => Flexible(
                child: Container(
                  margin: kEdgeA8(),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: kBorderAll(w: 3),
                      borderRadius: kBorderRadius(w: 12)),
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(data.name),
                    activeColor: Theme.of(context).colorScheme.primary,
                    groupValue: controller.seletedOption.value.index,
                    value: data.index,
                    onChanged: (val) => controller.onChangedSearchType(data),
                  ),
                ),
              )))
          .toList(),
    );
  }
}
