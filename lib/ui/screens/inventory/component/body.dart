import 'package:code_magic_ex/ui/screens/inventory/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class Body extends StatelessWidget {
  final InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        _createSearchView(),
        Expanded(child: _getBodyWidget(context)),
      ],
    ));
  }

  Widget _getBodyWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height,
      child: Obx(() => HorizontalDataTable(
        leftHandSideColumnWidth: 140,
        rightHandSideColumnWidth: 1200,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: controller.currentTabLength,
        rowSeparatorWidget: kDivider(),
      ),
    ));
  }

  List<Widget> _getTitleWidget() {
    final String totalPrice =
        calculateTotalPrice(controller.inventoryRecords, 'price');
    final String totalPv =
        calculateTotalPrice(controller.inventoryRecords, 'pv');

    return [
      _renderTableHeader(
          "Item Code", InventorySortTypes.itemCode, Alignment.center, 140),
      _renderTableHeader(
          "Item Name", InventorySortTypes.itemName, Alignment.center, 280),
      _renderTableHeader(
          "PV", InventorySortTypes.pv, Alignment.centerRight, 100),
      _renderTableHeader(
          "Price", InventorySortTypes.price, Alignment.centerRight, 100),
      _renderTableHeader("Quantity On Hand", InventorySortTypes.quantityOnHand,
          Alignment.centerRight, 180),
      _renderTableHeader("Total Accumlated Price ($totalPrice)",
          InventorySortTypes.totalAccumulatedPrice, Alignment.centerRight, 340),
      _renderTableHeader("Total PV ($totalPv)", InventorySortTypes.totalPV,
          Alignment.centerRight, 200),
    ];
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
      decoration:
          BoxDecoration(color: kMainColor, border: Border.all(width: 0.5)),
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

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.inventoryRecords.items[index];
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      child: Text(currentItem.item.id.unicity),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.inventoryRecords.items[index];
    return Row(
      children: <Widget>[
        Container(
            width: 280,
            height: 65,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(currentItem.catalogSlideContent.content.description)),
        _renderDataCell(index, 100, currentItem.terms.pvEach.toString(),
            Alignment.centerRight, "value"),
        _renderDataCell(index, 100, currentItem.terms.priceEach.toString(),
            Alignment.centerRight, "value"),
        _renderDataCell(index, 180, currentItem.quantityOnHand,
            Alignment.centerRight, "value"),
        _renderDataCell(
            index,
            340,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.priceEach),
            Alignment.centerRight,
            "value"),
        _renderDataCell(
            index,
            200,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.pvEach.toDouble()),
            Alignment.centerRight,
            "value"),
      ],
    );
  }

  Container _renderDataCell(int index, double width, String titleText,
      Alignment textAlign, String type) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: textAlign,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          titleText,
          style: TextStyle(color: type == 'link' ? Colors.blue : Colors.black),
        ),
      ),
    );
  }

  //Create a SearchView
  Widget _createSearchView() {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: kMainColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: TextField(
              cursorColor: Colors.grey[300],
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "Search",
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 86,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: kCircular8,
              child: ElevatedButton(
                onPressed: () => controller.resetSearchText(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kMainColor)),
                child: const Text("Clear"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
