import 'package:code_magic_ex/ui/screens/order_entry/components/search_box.dart';
import 'package:code_magic_ex/ui/screens/order_entry/components/top_tabs.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class Body extends StatelessWidget {
  final OrderEntryController controller = Get.put(OrderEntryController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 24.0),
          child: Text("Search with",
              style: Theme.of(context).textTheme.productTitle),
        ),
        SearchRadioOptions(),
        SearchBox(),
        Flexible(child: _getSearchResult(context)),
      ],
    );
  }

  Widget _getSearchResult(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: kMainColor),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      margin: const EdgeInsets.all(16),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 140,
        rightHandSideColumnWidth: 400,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: controller.searchResultsOfUserInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget("Item Code", 140),
      _getTitleItemWidget("Item Name", 400),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: kBorderSide(),
            right: kBorderSide(),
          ),),
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kMainColor)),
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.searchResultsOfUserInfo[index];
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      child: Text(currentItem.id.unicity.toString()),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.searchResultsOfUserInfo[index];
    return Row(
      children: <Widget>[
        Container(
            width: 400,
            height: 65,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(currentItem.humanName.fullName)),
      ],
    );
  }
}
