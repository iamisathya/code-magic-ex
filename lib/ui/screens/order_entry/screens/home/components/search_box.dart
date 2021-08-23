import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utilities/constants.dart';
import '../../../../../../utilities/extensions.dart';
import '../../../../../global/widgets/search_view.dart';
import '../../../controllers/controller.dart';

class SearchBox extends StatelessWidget {
  final OrderEntryController controller = Get.put(OrderEntryController());
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8, top: 8),
      child: Row(
        children: [
          Flexible(child: SearchViewWidget(controller: controller.searchIdTextController)),
          MaterialButton(
            shape: kRoundedRectangleBorder8(),
            disabledColor: Colors.grey,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => controller.searchUserBySearchQuery(context),
            height: 55,
            child:
                Text('search'.tr, style: Theme.of(context).textTheme.tableHeader),
          ),
        ],
      ),
    );
  }
}
