import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/colors.dart';
import '../../../../../utilities/constants.dart';
import '../../../../../utilities/enums.dart';
import '../../../../../utilities/function.dart';
import '../../../../../utilities/images.dart';
import '../../../../../utilities/parsing.dart';
import '../controller/inventory.home.controller.dart';

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
          itemCount: controller.inventoryItems.length,
          rowSeparatorWidget: kDivider(c: AppColor.brightGraySecond),
        ));
  }

  List<Widget> _getTitleWidget(BuildContext context) {
    String totalPrice =
        calculateInventoryTotal(controller.inventoryItems, 'price');
    totalPrice = NumberFormat().format(Parsing.intFrom(totalPrice));
    String totalPv =
        calculateInventoryTotal(controller.inventoryItems, 'pv');
    totalPv = NumberFormat().format(Parsing.intFrom(totalPv));

    return [
      _renderTableHeader("itemcode".tr, InventorySortTypes.itemCode,
          Alignment.center, 140, context),
      _renderTableHeader("itemname".tr, InventorySortTypes.itemName,
          Alignment.center, 250, context),
      _renderTableHeader("QTY", InventorySortTypes.quantityOnHand,
          Alignment.center, 96, context),
      _renderTableHeader(
          "pv".tr, InventorySortTypes.pv, Alignment.center, 100, context),
      _renderTableHeader("price".tr, InventorySortTypes.price,
          Alignment.center, 100, context),
      _renderTableHeader(
        "total_price_title".tr,
        InventorySortTypes.totalAccumulatedPrice,
        Alignment.center,
        180,
        context,
      ),
      _renderTableHeader("totalpv".tr, InventorySortTypes.totalPV,
          Alignment.center, 180, context)
    ];
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final currentItem = controller.inventoryItems[index];
    final alternativeBgColor = index % 2 == 0
        ? AppColor.kWhiteColor
        : (controller.activeStockType == "onHand")
            ? AppColor.cultured
            : AppColor.isabelline;
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: alternativeBgColor,
          border: const Border.symmetric(
              vertical:
                  BorderSide(width: 0.5, color: AppColor.brightGraySecond))),
      child: Text(currentItem.item!.id!.unicity!,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColor.charcoal)),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    final currentItem = controller.inventoryItems[index];
    final alternativeBgColor = index % 2 == 0
        ? AppColor.kWhiteColor
        : (controller.activeStockType == "onHand")
            ? AppColor.cultured
            : AppColor.isabelline;
    return Row(
      children: <Widget>[
        Container(
            width: 250,
            height: 65,
            decoration: BoxDecoration(
                color: alternativeBgColor,
                border: const Border.symmetric(
                    vertical: BorderSide(
                        width: 0.5, color: AppColor.brightGraySecond))),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(currentItem.catalogSlide!.content!.description!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColor.charcoal))),
        _renderDataCell(96, currentItem.quantityOnHand!, Alignment.center,
            context, alternativeBgColor),
        _renderDataCell(100, NumberFormat().format(currentItem.terms!.pvEach),
            Alignment.center, context, alternativeBgColor),
        _renderDataCell(100, NumberFormat().format(currentItem.terms!.priceEach),
            Alignment.center, context, alternativeBgColor),
        _renderDataCell(
            180,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand!,
                price: currentItem.terms!.priceEach!.toDouble()),
            Alignment.center,
            context,
            alternativeBgColor),
        _renderDataCell(
            180,
            calculateTotalAmount(
                quantity: currentItem.quantityOnHand!,
                price: currentItem.terms!.pvEach!.toDouble()),
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
        color: controller.activeStockType == "onHand"
            ? AppColor.cadetBlue
            : AppColor.brownYellow,
        height: 56,
        width: width,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: AppColor.kWhiteColor,
                    fontWeight: type == controller.currentType
                        ? FontWeight.w600
                        : FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(kSortIcon,
                width: 8,
                height: 10,
                semanticsLabel: 'sort icon',
                color: AppColor.kWhiteColor),
          )
        ]),
      ),
    );
  }

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
              vertical:
                  BorderSide(width: 0.5, color: AppColor.brightGraySecond))),
      alignment: textAlign,
      child: Text(titleText,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColor.kBlackColor)),
    );
  }
}
