import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/bloc/bloc.dart';
import 'package:code_magic_ex/ui/screens/github/custom_empty_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class Body extends StatelessWidget {
  final EasyShipController controller = Get.put(EasyShipController());
  final TextEditingController searchConntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<EasyShipController>(
            init: EasyShipController(),
            builder: (_) {
              return Column(
                children: [
                  _buildSearchContainer(context),
                  Expanded(
                    child: _buildChild(context),
                  ),
                ],
              );
            }));
  }

  Widget _buildChild(BuildContext context) {
    if (controller.loading.value) {
      return const CustomLoadingWidget(
        svgIcon: kImageBroswerStats,
      );
    } else if (controller.errorMessage.value.isNotEmpty) {
      return const CustomErrorWidget(
        svgIcon: kImageServerDown,
      );
    } else if (controller.isAllEasyShipOrdersEmpty) {
      return const CustomEmptyWidget(
        svgIcon: kImageEmptyBox,
      );
    } else {
      return _getBodyWidget();
    }
  }

  Widget _buildSearchContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Flexible(child: SearchViewWidget(controller: searchConntroller)),
          MaterialButton(
            shape: kRoundedRectangleBorder8(),
            disabledColor: Colors.grey,
            color: kPrimaryLightColor,
            onPressed: () {
              if (searchConntroller.text.isNotEmpty) {
                controller.getAllOrderlines(userId: searchConntroller.text);
              } else {
                _renderErrorSnackBar();
              }
            },
            height: 55,
            child:
                Text('Search', style: Theme.of(context).textTheme.tableHeader),
          ),
        ],
      ),
    );
  }

  void _renderErrorSnackBar() {
    return Get.snackbar(
      "Search field empty!",
      "Please enter user id to search.",
      titleText: const Text("Search field empty!",
          style: TextStyle(color: kPrimaryColor, fontSize: 16)),
      messageText: const Text("Please enter user id to search.",
          style: TextStyle(color: kPrimaryColor, fontSize: 14)),
      backgroundColor: Colors.white,
      borderColor: kPrimaryLightColor,
      animationDuration: const Duration(milliseconds: 300),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0,
      borderWidth: 2,
      icon: const Icon(
        Icons.error_outline,
        color: kPrimaryColor,
      ),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: Get.height,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 180,
        rightHandSideColumnWidth: 900,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: controller.allEasyShipOrdersCount,
        rowSeparatorWidget: kRowDivider,
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _renderTableHeader("Order Number", EasyShipTypes.orderNumber, 180),
      _renderTableHeader("Period", EasyShipTypes.period, 150),
      _renderTableHeader("Product Name", EasyShipTypes.productName, 300),
      _renderTableHeader("Item Code", EasyShipTypes.itemCode, 150),
      _renderTableHeader("PV", EasyShipTypes.pv, 150),
      _renderTableHeader("Price", EasyShipTypes.price, 150),
    ];
  }

  TextButton _renderTableHeader(
      String title, EasyShipTypes type, double width) {
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
      ),
    );
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryLightColor, border: Border.all(width: 0.5)),
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.getAllEasyShipOrders[index];
    final color = index % 2 == 0 ? Colors.white : kWhiteSmokeColor;
    return Container(
      width: 180,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 0.5), color: color),
      child: Text(currentItem.order.id.unicity.retrieveOrderId()),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.getAllEasyShipOrders[index];    
    return Row(
      children: <Widget>[
        _renderDataCell(150, index, currentItem.order.terms.period),
        _renderDataCell(300, index, currentItem.catalogSlide.content.description),
        _renderDataCell(150, index, currentItem.item.id.unicity),
        _renderDataCell(150, index, currentItem.terms.pvEach.toString()),
        _renderDataCell(150, index, currentItem.terms.priceEach.toString()),
      ],
    );
  }

  Container _renderDataCell(double width, int idx, String titleText) {
    final color = idx % 2 == 0 ? Colors.white : kWhiteSmokeColor;
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5), color: color),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          titleText,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
