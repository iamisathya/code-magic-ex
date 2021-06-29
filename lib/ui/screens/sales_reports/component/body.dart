import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:code_magic_ex/ui/screens/github/custom_empty_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/bloc/bloc.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:code_magic_ex/utilities/extensions.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final SalesReportController controller = Get.put(SalesReportController());
  final HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<SalesReportController>(
            init: SalesReportController(),
            builder: (_) {
              return Column(
                children: [
                  _renderDatePicker(context),
                  Expanded(child: _buildChild(context)),
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
    } else if (controller.allOrdersAndRmas.orders.isEmpty) {
      return const CustomEmptyWidget(
        svgIcon: kImageEmptyBox,
      );
    } else {
      return _getBodyWidget(context);
    }
  }

  Widget _getBodyWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 140,
        rightHandSideColumnWidth:
            controller.filterMethod.value == 'order' ? 1260 : 1300,
        isFixedHeader: true,
        headerWidgets: controller.filterMethod.value == 'order'
            ? _getTitleWidget()
            : _getRmaTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: controller.filterMethod.value == 'order'
            ? _generateRightHandSideColumnRow
            : _generateRightHandSideRmaColumnRow,
        itemCount: controller.currentTabLength,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
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
      _renderTableHeader(
          "Record", EasyShipSortTypes.record, Alignment.center, 140),
      _renderTableHeader(
          "BA Number", EasyShipSortTypes.baNumber, Alignment.center, 140),
      _renderTableHeader(
          "Name", EasyShipSortTypes.name, Alignment.centerLeft, 200),
      _renderTableHeader(
          "Order ID", EasyShipSortTypes.orderId, Alignment.center, 140),
      _renderTableHeader("Date", EasyShipSortTypes.date, Alignment.center, 140),
      _renderTableHeader("Time", EasyShipSortTypes.time, Alignment.center, 140),
      _renderTableHeader(
          "Total", EasyShipSortTypes.total, Alignment.centerRight, 200),
      _renderTableHeader(
          "Total PV", EasyShipSortTypes.totalPV, Alignment.centerRight, 200),
      _getTitleItemWidget('Barcode', 100, Alignment.center),
    ];
  }

  List<Widget> _getRmaTitleWidget() {
    return [
      _renderTableHeader(
          "Record", EasyShipSortTypes.record, Alignment.center, 140),
      _renderTableHeader(
          "BA Number", EasyShipSortTypes.baNumber, Alignment.center, 140),
      _renderTableHeader(
          "Name", EasyShipSortTypes.name, Alignment.centerLeft, 200),
      _renderTableHeader("Date", EasyShipSortTypes.date, Alignment.center, 140),
      _renderTableHeader("Time", EasyShipSortTypes.time, Alignment.center, 140),
      _renderTableHeader(
          "RMA", EasyShipSortTypes.orderId, Alignment.center, 140),
      _renderTableHeader(
          "Original", EasyShipSortTypes.orderId, Alignment.center, 140),
      _renderTableHeader(
          "Total", EasyShipSortTypes.total, Alignment.centerRight, 200),
      _renderTableHeader(
          "Total PV", EasyShipSortTypes.totalPV, Alignment.centerRight, 200),
    ];
  }

  TextButton _renderTableHeader(
      String title, EasyShipSortTypes type, Alignment align, double width) {
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
          color: kPrimaryLightColor, border: Border.all(width: 0.5)),
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
    final currentItem = controller.allOrdersAndRmas.orders[0].items[index];
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      child: Text(currentItem.creator.humanName.fullName),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.allOrdersAndRmas.orders[0].items[index];
    return Row(
      children: <Widget>[
        Container(
            width: 140,
            height: 65,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(currentItem.customer.id.unicity)),
        _renderDataCell(index, 200, currentItem.customer.humanName.fullName,
            Alignment.centerLeft, "value"),
        _renderDataCell(index, 140, currentItem.id.unicity.retrieveOrderId(),
            Alignment.center, "link"),
        _renderDataCell(index, 140, currentItem.dateCreated.asDDMMYYYY,
            Alignment.center, "value"),
        _renderDataCell(index, 140, currentItem.dateCreated.asHHMMA,
            Alignment.center, "value"),
        _renderDataCell(index, 200, currentItem.terms.total.toString(),
            Alignment.centerRight, "value"),
        _renderDataCell(index, 200, Parsing.stringFrom(currentItem.terms.pv),
            Alignment.centerRight, "value"),
        _renderDataIcon(),
      ],
    );
  }

  Widget _generateRightHandSideRmaColumnRow(BuildContext context, int index) {
    final RmaItem currentItem = controller.currentRmas[index];
    return Row(
      children: <Widget>[
        Container(
            width: 140,
            height: 65,
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
            child: Text(currentItem.customer.id.unicity)),
        _renderDataCell(index, 200, currentItem.customer.humanName.fullName,
            Alignment.centerLeft, "value"),
        _renderDataCell(index, 140, currentItem.id.unicity.retrieveOrderId(),
            Alignment.center, "link"),
        _renderDataCell(index, 140, currentItem.dateCreated.asDDMMYYYY,
            Alignment.center, "value"),
        _renderDataCell(index, 140, currentItem.dateCreated.asHHMMA,
            Alignment.center, "value"),
        _renderDataCell(index, 140, currentItem.id.unicity.retrieveOrderId(),
            Alignment.center, "value"),
        _renderDataCell(index, 200, currentItem.terms.total.toString(),
            Alignment.centerRight, "value"),
        _renderDataCell(index, 200, Parsing.stringFrom(currentItem.terms.pv),
            Alignment.centerRight, "value"),
      ],
    );
  }

  Container _renderDataIcon() {
    return Container(
      width: 100,
      height: 65,
      decoration: BoxDecoration(border: Border.all(width: 0.5)),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.info_outline, color: Colors.red, size: 33),
      ),
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

  Container _renderDatePicker(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Row(
        children: [
          Flexible(
            child: Container(
                margin: const EdgeInsets.only(right: 4),
                child: TextField(
                  controller: controller.startDate,
                  readOnly: true,
                  onTap: () {
                    DatePicker.showDatePicker(context, onConfirm: (date) {
                      controller.startDate.text =
                          DateFormat('yyyy-MM-dd').format(date).toString();
                    });
                  },
                  decoration:
                      _renderInputDecoration("Select from date", "From"),
                )),
          ),
          Flexible(
            child: Container(
                margin: const EdgeInsets.only(left: 4),
                child: TextField(
                  controller: controller.endDate,
                  readOnly: true,
                  onTap: () {
                    DatePicker.showDatePicker(context, onConfirm: (date) {
                      controller.endDate.text =
                          DateFormat('yyyy-MM-dd').format(date).toString();
                    }, currentTime: DateTime.now());
                  },
                  decoration: _renderInputDecoration("Select to date", "To"),
                )),
          ),
          SizedBox(
            width: 66,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                decoration: kCircular8,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                  tooltip: 'Find easy ship',
                  onPressed: () => controller.loadSalesReports(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _renderInputDecoration(String hintText, String label) {
    return InputDecoration(
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor)),
      hintText: hintText,
      labelText: label,
    );
  }
}
