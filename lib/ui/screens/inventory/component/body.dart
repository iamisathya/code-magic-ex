import 'package:code_magic_ex/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/function.dart';
import '../../../../utilities/parsing.dart';
import '../../../global/widgets/search_view_button.dart';
import '../controller/inventory.controller.dart';

class Body extends StatelessWidget {
  final InventoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
        init: InventoryController(),
        initState: (state) {
          controller.loadInventoryProducts(context);
        },
        builder: (_) => Obx(() => Column(
              children: [
                SearchWithButton(
                    onTextChange: (val) => controller.onSearchTextChanged(val),
                    searchController: controller.searchController,
                    onPressClear: controller.resetSearchText),
                Expanded(child: _getBodyWidget(context)),
              ],
            )));
  }

  Widget _getBodyWidget(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 140,
      rightHandSideColumnWidth: 1200,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: controller.tempInventoryRecords.value.items.length,
      rowSeparatorWidget: kDivider(),
    );
  }

  List<Widget> _getTitleWidget() {
    String totalPrice =
        calculateTotalPrice(controller.tempInventoryRecords.value, 'price');
    totalPrice = NumberFormat().format(Parsing.intFrom(totalPrice));
    String totalPv =
        calculateTotalPrice(controller.tempInventoryRecords.value, 'pv');
    totalPv = NumberFormat().format(Parsing.intFrom(totalPv));

    return [
      _renderTableHeader(
          "itemcode".tr, InventorySortTypes.itemCode, Alignment.center, 140),
      _renderTableHeader(
          "itemname".tr, InventorySortTypes.itemName, Alignment.center, 280),
      _renderTableHeader(
          "pv".tr, InventorySortTypes.pv, Alignment.centerRight, 100),
      _renderTableHeader(
          "price".tr, InventorySortTypes.price, Alignment.centerRight, 100),
      _renderTableHeader("ctotal".tr, InventorySortTypes.quantityOnHand,
          Alignment.centerRight, 180),
      _renderTableHeader(
          "${"total_price_title".tr} ${"($totalPrice ${Globals.currency})"}",
          InventorySortTypes.totalAccumulatedPrice,
          Alignment.centerRight,
          340),
      _renderTableHeader("${"totalpv".tr} ${"($totalPv ${Globals.currency})"}",
          InventorySortTypes.totalPV, Alignment.centerRight, 200),
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.tempInventoryRecords.value.items[index];
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      child: Text(currentItem.item.id.unicity,
          style: Theme.of(context).textTheme.button),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.tempInventoryRecords.value.items[index];
    return Row(
      children: <Widget>[
        Container(
            width: 280,
            height: 65,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(currentItem.catalogSlideContent.content.description,
                style: Theme.of(context).textTheme.subtitle2)),
        _renderDataCell(100, NumberFormat().format(currentItem.terms.pvEach),
            Alignment.centerRight),
        _renderDataCell(100, NumberFormat().format(currentItem.terms.priceEach),
            Alignment.centerRight),
        _renderDataCell(180, currentItem.quantityOnHand, Alignment.centerRight),
        _renderDataCell(
            340,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.priceEach),
            Alignment.centerRight),
        _renderDataCell(
            200,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.pvEach.toDouble()),
            Alignment.centerRight),
      ],
    );
  }

  TextButton _renderTableHeader(
      String title, InventorySortTypes type, Alignment align, double width) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        controller.onSortCulumn(type);
      },
      child: _getTitleItemWidget(
          '$title ${controller.currentType == type ? (controller.isAscending ? '↓' : '↑') : ''}',
          width,
          align),
    );
  }

  Widget _getTitleItemWidget(String label, double width, Alignment alignment) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.primary,
          border: Border.all(width: 0.5)),
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Container _renderDataCell(
    double width,
    String titleText,
    Alignment textAlign,
  ) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: textAlign,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Text(titleText, style: Theme.of(Get.context!).textTheme.subtitle2),
      ),
    );
  }
}
