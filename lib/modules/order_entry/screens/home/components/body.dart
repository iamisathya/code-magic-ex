import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/search_reponse_by_href.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/extensions.dart';
import '../../../controllers/main.controller.dart';
import 'search_box.dart';
import 'top_tabs.dart';

class Body extends StatelessWidget {
  final OrderEntryController controller = Get.put(OrderEntryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kEdgeA8(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 24.0),
            child: Text("search_with",
                style: Theme.of(context).textTheme.productTitle),
          ),
          SearchRadioOptions(),
          SearchBox(),
          Obx(() => Expanded(child: _getSearchResult(context))),
        ],
      ),
    );
  }

  Widget _getSearchResult(BuildContext context) {
    return ListView.builder(
        itemCount: controller.searchResultsOfUserInfo.length,
        itemBuilder: (context, i) => _renderResultItem(i, context));
  }

  Widget _renderResultItem(int i, BuildContext context) {
    final SearchedUserInfo currentItem = controller.searchResultsOfUserInfo[i];
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(Icons.person_search_outlined,
              color: Theme.of(context).colorScheme.primary),
          title: Text(currentItem.id.unicity.toString()),
          subtitle: Text(currentItem.humanName.fullName),
          trailing: Icon(Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.primary),
          onTap: () => controller.onClickOpenOrderEntry(currentItem),
        ),
      ),
    );
  }
}
