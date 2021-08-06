import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../../models/inventory_records.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/core/parsing.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../../global/widgets/counter_view.dart';
import '../../controller/open_po_table_controller.dart';

class OpenPoTableBody extends StatelessWidget {
  final OpenPoTableController controller;
  const OpenPoTableBody({required this.controller});
      
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HorizontalDataTable(
        leftHandSideColumnWidth: 180,
        rightHandSideColumnWidth: 1320,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(context),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: controller.cartProducts.length,
      ),
    );
  }

  List<Widget> _getTitleWidget(BuildContext context) {
    return [
      _getTitleItemWidget("Item Code", 180, context),
      _getTitleItemWidget("Product Name", 300, context),
      _getTitleItemWidget("Qty Order", 150, context),
      _getTitleItemWidget("PV", 150, context),
      _getTitleItemWidget("Item Price", 200, context),
      _getTitleItemWidget("Total PV", 200, context),
      _getTitleItemWidget("Total Price", 200, context),
      _getTitleItemWidget("Remove", 120, context),
    ];
  }

  Widget _getTitleItemWidget(String label, double width, BuildContext context) {
    return Container(
      decoration: kTableHeaderBoxDecoration(),
      width: width,
      height: 56,
      alignment: Alignment.center,
      child: Text(label, style: Theme.of(context).textTheme.tableHeader),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          height: 65,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
          child: renderAutoComplete(index),
        ));
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.cartProducts[index];
    final bool isEmptyQty = currentItem.quantity == 0;

    return Row(
      children: <Widget>[
        _renderDataCell(300, currentItem.productName),
        _renderContainerWidget(isEmptyQty
            ? const Center()
            : Center(
                child: CounterView(
                    itemCode: currentItem.itemCode,
                    onPress: controller.onUpdateQuantity,
                    quantity: currentItem.quantity))),
        _renderDataCell(
            150, isEmptyQty ? "" : Parsing.stringFrom(currentItem.itemPv)),
        _renderDataCell(
            200, isEmptyQty ? "" : Parsing.stringFrom(currentItem.itemPrice)),
        _renderDataCell(
            200, isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPv)),
        _renderDataCell(
            200, isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPrice)),
        _renderDataWidget(120, currentItem.itemCode, isEmptyQty),
      ],
    );
  }

  Container _renderContainerWidget(Widget widget) {
    return Container(
        width: 150,
        height: 65,
        decoration: BoxDecoration(border: Border.all(width: 0.5)),
        child: widget);
  }

  Container _renderDataCell(double width, String titleText) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      alignment: Alignment.center,
      child: Text(titleText),
    );
  }

  Container _renderDataWidget(double width, String itemCode, bool show) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      alignment: Alignment.center,
      child: !show
          ? CommonButton(
              c: Colors.red,
              value: itemCode,
              label: 'Remove',
              onPressed: controller.onPressRemove)
          : const SizedBox(),
    );
  }

  Widget clearButtonBuilder() {
    return ElevatedButton(
        onPressed: () => {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
        child: const Text("Clear"));
  }

  Autocomplete renderAutoComplete(int idx) {
    String _displayStringForOption(InventoryRecordItems option) =>
        option.item.id.unicity;
    final itemCode = controller.cartProducts[idx].itemCode;

    return Autocomplete<InventoryRecordItems>(
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          textAlign: TextAlign.center,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: (itemCode != "")
                  ? IconButton(
                      onPressed: () {
                        if (itemCode == "") return;
                        controller.onPressRemove(itemCode);
                        fieldTextEditingController.text = "";
                      },
                      icon: const Icon(Icons.clear, color: Colors.black))
                  : const SizedBox()),
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(fontWeight: FontWeight.bold),
        );
      },
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          if (itemCode != "") {
            controller.onPressRemove(itemCode);
          }
          return const Iterable<InventoryRecordItems>.empty();
        }
        return controller.inventoryRecords.value.items
            .where((InventoryRecordItems option) {
          return option.item.id.unicity.contains(textEditingValue.text);
        });
      },
      onSelected: (InventoryRecordItems item) {
        controller.addItemToCart(
            itemCode: _displayStringForOption(item), index: idx);
      },
    );
  }
}
