import 'package:code_magic_ex/ui/global/widgets/counter_view.dart';
import 'package:code_magic_ex/ui/global/widgets/product_entry_auto_complete.dart';
import 'package:code_magic_ex/ui/global/widgets/table_header_title.dart';
import 'package:code_magic_ex/ui/screens/order_entry/controllers/order_entry_controller.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Flexible(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: Get.height,
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 150,
              rightHandSideColumnWidth: 1200,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: controller.cartProducts.length,
              rowSeparatorWidget: kRowDivider,
            ),
          ),
        ),
        if (controller.cartProducts.isNotEmpty) _renderCartFooter(context),
      ],
    );
  }

  Container _renderCartFooter(BuildContext context) {
    return Container(
        padding: kEdgeV12H16(),
        color: Colors.black54,
        width: Get.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Total Price: ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      controller.totalCartPrice().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Total PV: ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      controller.totalCartPv().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor, padding: kEdgeA12()),
              onPressed: () => controller.placeOrder(),
              child: const Text("Place Order"),
            ),
          ],
        ));
  }

  List<Widget> _getTitleWidget() {
    return [
      _renderTableHeader("Item Code", 150),
      _renderTableHeader("Product Name", 300),
      _renderTableHeader("Qty Order", 150),
      _renderTableHeader("PV", 150),
      _renderTableHeader("Item Price", 200),
      _renderTableHeader("Total PV", 200),
      _renderTableHeader("Total Price", 200),
    ];
  }

  TextButton _renderTableHeader(String title, double width) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {},
      child: TableHeaderTitle(
        label: title,
        width: width,
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.cartProducts[index];
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: 150,
          height: 65,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: ProductEntryAutoComplete(
              idx: index,
              inventoryRecords: controller.inventoryRecords.value,
              onSelected: (String itemCode, int idx) {
                controller.addItemToCart(itemCode: itemCode, index: idx);
              }),
        ));
  }

  Widget _renderCounterButton(int quantity, String itemCode) {
    return CounterView(
        itemCode: itemCode,
        quantity: quantity,
        onPress: (type, itemCode) {
          if (type == CartUpdate.decreament) {
            controller.updateQuantity(CartUpdate.decreament, itemCode);
          } else {
            controller.updateQuantity(CartUpdate.increament, itemCode);
          }
        });
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.cartProducts[index];
    final bool isEmptyQty = currentItem.quantity == 0;

    return GestureDetector(
      onTap: () {},
      child: Row(
        children: <Widget>[
          TableHeaderTitle(
            label: currentItem.productName,
            width: 300,
          ),
          _renderContainerWidget(isEmptyQty
              ? const Center()
              : Center(
                  child: _renderCounterButton(
                      currentItem.quantity, currentItem.itemCode))),
          TableHeaderTitle(
              label: isEmptyQty ? "" : Parsing.stringFrom(currentItem.itemPv),
              width: 150),
          TableHeaderTitle(
              label:
                  isEmptyQty ? "" : Parsing.stringFrom(currentItem.itemPrice),
              width: 200),
          TableHeaderTitle(
              label: isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPv),
              width: 200),
          TableHeaderTitle(
              label:
                  isEmptyQty ? "" : Parsing.stringFrom(currentItem.totalPrice),
              width: 200),
        ],
      ),
    );
  }

  SizedBox _renderContainerWidget(Widget widget) {
    return SizedBox(
        width: 150,
        height: 65,
        child: widget);
  }
}
