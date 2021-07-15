import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/widgets/cart_footer.dart';
import 'package:code_magic_ex/ui/global/widgets/counter_view.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class OrderEntryBody extends StatelessWidget {
  final OrderEntryTableController controller =
      Get.put(OrderEntryTableController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _renderDataTable(context),
    );
  }

  Widget _renderDataTable(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: HorizontalDataTable(
          leftHandSideColumnWidth: 150,
          rightHandSideColumnWidth: 1200,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(context),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: controller.cartProducts.length,
        )),
      ],
    );
  }

  List<Widget> _getTitleWidget(BuildContext context) {
    return [
      _getTitleItemWidget("Item Code", 150, context),
      _getTitleItemWidget("Product Name", 300, context),
      _getTitleItemWidget("Qty Order", 150, context),
      _getTitleItemWidget("PV", 150, context),
      _getTitleItemWidget("Item Price", 200, context),
      _getTitleItemWidget("Total PV", 200, context),
      _getTitleItemWidget("Total Price", 200, context),
    ];
  }

  Widget _getTitleItemWidget(String label, double width, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kMainColor,
          border: Border.all(width: 0.5, color: Colors.white)),
      width: width,
      height: 56,
      alignment: Alignment.center,
      child: Text(label, style: Theme.of(context).textTheme.tableHeader),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.cartProducts[index];
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

    return GestureDetector(
      onTap: () {},
      child: Row(
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
          _renderDataCell(200,
              isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPrice)),
        ],
      ),
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

  Autocomplete renderAutoComplete(int idx) {
    String _displayStringForOption(InventoryRecordItems option) =>
        option.item.id.unicity;

    return Autocomplete<InventoryRecordItems>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<InventoryRecordItems>.empty();
        }
        return controller.inventoryRecords.value.items
            .where((InventoryRecordItems option) {
          return option.toString().contains(textEditingValue.text);
        });
      },
      onSelected: (InventoryRecordItems item) {
        controller.addItemToCart(
            itemCode: _displayStringForOption(item), index: idx);
      },
    );
  }
}
