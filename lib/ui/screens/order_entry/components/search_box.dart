import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  final OrderEntryController controller = Get.put(OrderEntryController());
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Flexible(child: SearchViewWidget(controller: controller.searchIdTextController)),
          MaterialButton(
            shape: kRoundedRectangleBorder8(),
            disabledColor: Colors.grey,
            color: kMainColor,
            onPressed: () => controller.searchUserBySearchQuery(),
            height: 55,
            child:
                Text('Search', style: Theme.of(context).textTheme.tableHeader),
          ),
        ],
      ),
    );
  }
}
