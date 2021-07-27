import 'package:code_magic_ex/ui/screens/open_po/controller/open_po_controller.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/ui/screens/github/custom_empty_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/webview/webview.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class Body extends StatelessWidget {
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();
  final OpenPoController controller = Get.put(OpenPoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<OpenPoController>(
          init: OpenPoController(),
          initState: (state) {
            controller.getAllOpenPo();
          },
          builder: (_) {
            return _buildChild();
          }),
    );
  }

  // *
  Widget _buildChild() {
    if (controller.loading.value) {
      return const CustomLoadingWidget(
        svgIcon: kImageBroswerStats,
      );
    } else if (controller.errorMessage.value.isNotEmpty) {
      return const CustomErrorWidget(
        svgIcon: kImageServerDown,
      );
    } else if (controller.isEmptyList.value) {
      return const CustomEmptyWidget(
        svgIcon: kImageEmptyBox,
      );
    } else {
      return _getBodyWidget();
    }
  }

  Widget _getBodyWidget() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: Get.height,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 200,
        rightHandSideColumnWidth: 1080,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: controller.currentItemsLength,
        rowSeparatorWidget: kRowDivider,
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 100,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        htdRefreshController: _hdtRefreshController,
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _renderTableHeader("P/O Number", OpenPoTypes.poNumber, 200),
      _renderTableHeader("Date", OpenPoTypes.date, 180),
      _renderTableHeader("Time", OpenPoTypes.time, 180),
      _renderTableHeader("Total PV", OpenPoTypes.totalPv, 180),
      _renderTableHeader("Total Price", OpenPoTypes.totalPrice, 180),
      _renderTableHeader("Status", OpenPoTypes.status, 180),
      _renderTableHeader("Attachment", OpenPoTypes.attachment, 180),
    ];
  }

  TextButton _renderTableHeader(String title, OpenPoTypes type, double width) {
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
    final currentItem = controller.openPlaceOrders[index];
    return GestureDetector(
        onTap: () {
          controller.getOpenPlaceOrderDetails(currentItem.orderOpid, context);
        },
        child: Container(
          width: 140,
          height: 65,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 0.5)),
          child: Text(currentItem.orderOpid),
        ));
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.openPlaceOrders[index];
    return GestureDetector(
      onTap: () {
        controller.getOpenPlaceOrderDetails(currentItem.orderOpid, context);
      },
      child: Row(
        children: <Widget>[
          Container(
              width: 180,
              height: 65,
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.center,
              child: Text(currentItem.orderDate)),
          _renderDataCell(index, 180, currentItem.orderTime,
              Alignment.centerRight, "value"),
          _renderDataCell(index, 180, currentItem.orderTotalPv,
              Alignment.centerRight, "link"),
          _renderDataCell(index, 180, currentItem.orderTotalPrice,
              Alignment.center, "value"),
          _renderDataCellWidget(
            180,
            Alignment.center,
            _renderStatusButton(
                context, currentItem.orderStatus.retrieveOrderStatus()),
          ),
          _renderDataCellWidget(180, Alignment.centerRight,
              _renderAttachement(context, currentItem)),
        ],
      ),
    );
  }

  Container _renderDataCellWidget(
      double width, Alignment textAlign, Widget widget) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: widget,
    );
  }

  IconButton _renderAttachement(BuildContext context, OpenPO currentItem) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebivewHomeScreen(
                  url:
                      "${Address.resource}${currentItem.iconAttachment.retrieveAttachementName()}",
                ),
              ));
        },
        icon: const Icon(Icons.attach_file, color: kMainColor));
  }

  Container _renderDataCell(int index, double width, String titleText,
      Alignment textAlign, String type) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          titleText,
          style: TextStyle(color: type == 'link' ? kMainColor : Colors.black),
        ),
      ),
    );
  }

  Container _renderStatusButton(BuildContext context, String status) {
    if (status == "0") {
      _renderEachStatusButton(context, "Pending", kTernaryLightColor);
    } else if (status == "4") {
      return _renderEachStatusButton(context, "Approved", kMainColor);
    } else if (status == "2") {
      return _renderEachStatusButton(context, "Unknown", kSecondaryColor);
    }
    return _renderEachStatusButton(context, "Deleted", Colors.red);
  }

  Container _renderEachStatusButton(
      BuildContext context, String text, Color color) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 100,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
      child: Text(text, style: Theme.of(context).textTheme.whiteButtonText),
    );
  }
}
