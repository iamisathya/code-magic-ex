import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/ui/screens/inventory/controller/inventory.home.controller.dart';
import 'package:dsc_tools/utilities/constants.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/function.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:dsc_tools/utilities/parsing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

class TableView extends StatelessWidget {
  final InventoryHomeController controller = Get.put(InventoryHomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => HorizontalDataTable(
          leftHandSideColumnWidth: 140,
          rightHandSideColumnWidth: 906,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(context),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: controller.tempInventoryRecords.value.items.length,
          rowSeparatorWidget: kDivider(c: const Color(0xFFEAEAEA)),
        ));
  }

  List<Widget> _getTitleWidget(BuildContext context) {
    String totalPrice =
        calculateTotalPrice(controller.tempInventoryRecords.value, 'price');
    totalPrice = NumberFormat().format(Parsing.intFrom(totalPrice));
    String totalPv =
        calculateTotalPrice(controller.tempInventoryRecords.value, 'pv');
    totalPv = NumberFormat().format(Parsing.intFrom(totalPv));

    return [
      _renderTableHeader("itemcode".tr, InventorySortTypes.itemCode,
          Alignment.center, 140, context),
      _renderTableHeader("itemname".tr, InventorySortTypes.itemName,
          Alignment.center, 250, context),
      _renderTableHeader("QTY", InventorySortTypes.quantityOnHand,
          Alignment.centerRight, 96, context),
      _renderTableHeader(
          "pv".tr, InventorySortTypes.pv, Alignment.centerRight, 100, context),
      _renderTableHeader("price".tr, InventorySortTypes.price,
          Alignment.centerRight, 100, context),
      _renderTotalContainer(
          "total_price_title".tr,
          "($totalPrice ${Globals.currency})",
          context,
          InventorySortTypes.totalAccumulatedPrice),
      _renderTotalContainer("totalpv".tr, "($totalPv ${Globals.currency})",
          context, InventorySortTypes.totalPV)
    ];
  }

  GestureDetector _renderTotalContainer(String label, String value,
      BuildContext context, InventorySortTypes type) {
    return GestureDetector(
      onTap: () => controller.onSortCulumn(type),
      child: Container(
          color: const Color(0xFF5297A6),
          height: 55,
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _renderWhiteText(label, context, const Color(0xFFFFFFFF)),
                  _renderWhiteText(value, context, const Color(0xFFE7BB4A)),
                ],
              ),
              SvgPicture.asset(
                kSortIcon,
                width: 8,
                height: 10,
                semanticsLabel: 'sort icon',
                color: const Color(0xFFFFFFFF),
              )
            ],
          )),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.tempInventoryRecords.value.items[index];
    final alternativeBgColor =
        index % 2 == 0 ? const Color(0xFFFFFFFF) : const Color(0xFFF1FAF7);
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: alternativeBgColor,
          border: const Border.symmetric(
              vertical: BorderSide(width: 0.5, color: Color(0xFFEAEAEA)))),
      child: Text(currentItem.item.id.unicity,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: const Color(0xFF384250))),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.tempInventoryRecords.value.items[index];
    final alternativeBgColor =
        index % 2 == 0 ? const Color(0xFFFFFFFF) : const Color(0xFFF1FAF7);
    return Row(
      children: <Widget>[
        Container(
            width: 250,
            height: 65,
            decoration: BoxDecoration(
                color: alternativeBgColor,
                border: const Border.symmetric(
                    vertical:
                        BorderSide(width: 0.5, color: Color(0xFFEAEAEA)))),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(currentItem.catalogSlideContent.content.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF384250)))),
        _renderDataCell(96, currentItem.quantityOnHand, Alignment.center,
            context, alternativeBgColor),
        _renderDataCell(100, NumberFormat().format(currentItem.terms.pvEach),
            Alignment.center, context, alternativeBgColor),
        _renderDataCell(100, NumberFormat().format(currentItem.terms.priceEach),
            Alignment.center, context, alternativeBgColor),
        _renderDataCell(
            180,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.priceEach),
            Alignment.center,
            context,
            alternativeBgColor),
        _renderDataCell(
            180,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand,
                price: currentItem.terms.pvEach.toDouble()),
            Alignment.center,
            context,
            alternativeBgColor),
      ],
    );
  }

  Widget _renderTableHeader(String title, InventorySortTypes type,
      Alignment align, double width, BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onSortCulumn(type),
      child: Container(
        color: const Color(0xFF5297a6),
        height: 56,
        width: width,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: type == controller.currentType
                      ? FontWeight.w600
                      : FontWeight.w400)),
          SvgPicture.asset(
            kSortIcon,
            width: 8,
            height: 10,
            semanticsLabel: 'sort icon',
            color: const Color(0xFFFFFFFF),
          )
        ]),
      ),
    );
  }

  Text _renderWhiteText(String title, BuildContext context, Color color) =>
      Text(title,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: color));

  Container _renderDataCell(
    double width,
    String titleText,
    Alignment textAlign,
    BuildContext context,
    Color color,
  ) {
    return Container(
      width: width,
      height: 65,
      decoration: BoxDecoration(
          color: color,
          border: const Border.symmetric(
              vertical: BorderSide(width: 0.5, color: Color(0xFFEAEAEA)))),
      alignment: textAlign,
      child: Text(titleText,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: const Color(0xFF000000))),
    );
  }
}
