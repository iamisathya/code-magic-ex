import 'package:code_magic_ex/models/search_reponse_by_href.dart';
import 'package:code_magic_ex/ui/screens/github/custom_empty_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/controller.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/home/components/search_box.dart';
import 'package:code_magic_ex/ui/screens/order_entry/screens/home/components/top_tabs.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';

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
            child: Text("Search with",
                style: Theme.of(context).textTheme.productTitle),
          ),
          SearchRadioOptions(),
          SearchBox(),
          Obx(()=> _buildChild(context)),
        ],
      ),
    );
  }

  // *
  Widget _buildChild(BuildContext context) {
    if (controller.isSearching.value == true) {
      return const CustomLoadingWidget(
        svgIcon: kImageBroswerStats,
      );
    } else if (controller.errorMessage.value.isNotEmpty) {
      return const CustomErrorWidget(
        svgIcon: kImageServerDown,
      );
    } else if (controller.searchResultsOfUserInfo.isEmpty) {
      return const CustomEmptyWidget(
        svgIcon: kImageEmptyBox,
      );
    } else {
      return Expanded(child: _getSearchResult(context));
    }
  }

  Widget _getSearchResult(BuildContext context) {
    return ListView.builder(
        itemCount: controller.searchResultsOfUserInfo.length, itemBuilder: (context, i) => _renderResultItem(i));
  }

  Widget _renderResultItem(int i) {
    final SearchedUserInfo currentItem = controller.searchResultsOfUserInfo[i];
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const Icon(Icons.person_search_outlined, color: kMainColor),
          title: Text(currentItem.id.unicity.toString()),
          subtitle: Text(currentItem.humanName.fullName),
          trailing: const Icon(Icons.arrow_forward_ios, color: kMainColor),
          onTap: ()=> controller.onClickOpenOrderEntry(currentItem.id.unicity.toString()),
        ),
      ),
    );
  }
}
