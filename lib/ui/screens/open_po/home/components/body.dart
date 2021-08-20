import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../../api/api_address.dart';
import '../../../../../models/open_po.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/extensions.dart';
import '../../../../../utilities/images.dart';
import '../../../../global/widgets/custom_empty_widget.dart';
import '../../../../global/widgets/custom_error_widget.dart';
import '../../../../global/widgets/custom_loading_widget.dart';
import '../../../webview/webview.dart';
import '../../controller/open_po_controller.dart';

class Body extends StatelessWidget {
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
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _renderTableHeader("po_number".tr, OpenPoTypes.poNumber, 200, false),
      _renderTableHeader("date".tr, OpenPoTypes.date, 180, true),
      _renderTableHeader("time".tr, OpenPoTypes.time, 180, true),
      _renderTableHeader("totalpv".tr, OpenPoTypes.totalPv, 180, true),
      _renderTableHeader("totalprice".tr, OpenPoTypes.totalPrice, 180, true),
      _renderTableHeader("status".tr, OpenPoTypes.status, 180, false),
      _renderTableHeader("attachment".tr, OpenPoTypes.attachment, 180, false),
    ];
  }

  TextButton _renderTableHeader(String title, OpenPoTypes type, double width, bool sorting) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        if(sorting) {
          controller.onSortCulumn(type);
        }
      },
      child: _getTitleItemWidget(
        '$title ${controller.currentType == type ? (controller.isAscending ? '↓' : '↑') : ''}',
        width,
      ),
    );
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      decoration:
          BoxDecoration(color: kMainColor, border: Border.all(width: 0.5)),
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
              Alignment.centerRight, "value"),
          _renderDataCell(index, 180, currentItem.orderTotalPrice,
              Alignment.center, "value"),
          _renderDataCellWidget(
            180,
            Alignment.center,
            _renderStatusButton(
                context, currentItem.orderStatus),
          ),
          _renderDataCellWidget(
              180,
              Alignment.centerRight,
              currentItem.iconAttachment.retrieveAttachementName() != "0"
                  ? _renderAttachement(context, currentItem)
                  : const SizedBox()),
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
    final String attchmentName = currentItem.iconAttachment.retrieveAttachementName();
    final String url =
        "${Address.resource}$attchmentName";
    return IconButton(
        onPressed: () => Get.to(() => WebivewHomeScreen(url: url, title: attchmentName)),
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
      return _renderEachStatusButton(context, "Pending", kPendingColor);
    } else if (status == "1") {
      return _renderEachStatusButton(context, "Deleted", Colors.red);
    }else if (status == "2") {
      return _renderEachStatusButton(context, "Unknown", kSecondaryColor);
    }  else if (status == "3") {
      return _renderEachStatusButton(context, "Processing", kMainColor);
    } else {
      return _renderEachStatusButton(context, "Completed", Colors.green);
    }    
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
