import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/bloc/bloc.dart';
import 'package:code_magic_ex/ui/global/widgets/custom_empty_widget.dart';
import 'package:code_magic_ex/ui/global/widgets/custom_error_widget.dart';
import 'package:code_magic_ex/ui/global/widgets/custom_loading_widget.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/function.dart';
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
    searchConntroller.text = "2970466";
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
    } else if (controller.isEasyShipReportsEmpty) {
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
            color: kMainColor,
            onPressed: () {
              if (searchConntroller.text.isNotEmpty) {
                controller.getAllOrderlines(userId: searchConntroller.text);
              } else {
                renderErrorSnackBar(title: "Search field empty!", subTitle: "Please enter user id to search.");
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
        itemCount: controller.easyShipReportsCount,
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
          color: kMainColor, border: Border.all(width: 0.5)),
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
    final currentItem = controller.getEasyShipReports[index];
    final color = currentItem.itemName == "Total" ? kWhiteSmokeColor : Colors.white;
    return Container(
      width: 180,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 0.5), color: color),
      child: Text(currentItem.orderNumber),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.getEasyShipReports[index];
    final color = currentItem.itemName == "Total" ? kWhiteSmokeColor : Colors.white;
    return Row(
      children: <Widget>[
        _renderDataCell(150, color, currentItem.pvDate),
        _renderDataCell(300, color, currentItem.name),
        _renderDataCell(150, color, currentItem.itemName),
        _renderDataCell(150, color, currentItem.pv.toString()),
        _renderDataCell(150, color, currentItem.totalPrice),
      ],
    );
  }

  Container _renderDataCell(double width, Color color, String titleText) {
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
