import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/ui/global/theme/app_theme.dart';
import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/bloc/bloc.dart';
import 'package:code_magic_ex/ui/screens/github/custom_empty_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/extensions.dart';

class Body extends StatelessWidget {
  final EasyShipController controller = Get.put(EasyShipController());
  TextEditingController searchConntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final ClassOne _oneeeeeene = ClassOne(secend: const ClassTwo(value: "THis is annotjher vvalue"));
    // print(_oneeeeeene.secend.value);

    return SafeArea(
        child: GetBuilder<EasyShipController>(
            init: EasyShipController(),
            builder: (_) {
              return SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      _buildSearchContainer(context),
                      _buildChild(context),
                    ],
                  ),
                ),
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
    } else if (controller.allEasyShipOrders.items.length == 1) {
      return const CustomEmptyWidget(
        svgIcon: kImageEmptyBox,
      );
    } else {
      return _renderDataTable(context);
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

  Row _renderDataTable(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildMainCells(context),
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRows(context),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildMainCells(BuildContext context) {
    return List.generate(
      controller.allEasyShipOrders.items.length,
      (index) => GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 140.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: index == 0
                ? kPrimaryLightColor
                : index.isEven
                    ? kWhiteSmokeColor
                    : Colors.white,
            border: Border.all(width: 0.5),
          ),
          child: Text(
            controller.allEasyShipOrders.items[index].order.id.unicity
                .retrieveOrderId(),
            style: index != 0
                ? Theme.of(context).textTheme.tableData
                : Theme.of(context).textTheme.tableHeader,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRows(BuildContext context) {
    return List.generate(
      controller.allEasyShipOrders.items.length,
      (index) => Row(
        children: _buildCells(index, context),
      ),
    );
  }

  List<Widget> _buildCells(int mainIndex, BuildContext context) {
    return List.generate(5, (index) {
      final OrderLineItem currentItem =
          controller.allEasyShipOrders.items[mainIndex];
      return GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: index == 1 ? 320 : 120,
          height: 60.0,
          decoration: BoxDecoration(
            color: mainIndex == 0
                ? kPrimaryLightColor
                : mainIndex.isEven
                    ? kWhiteSmokeColor
                    : Colors.white,
            border: Border.all(width: 0.5),
          ),
          child: _renderTableHeader(index, currentItem, mainIndex, context),
        ),
      );
    });
  }

  Text _renderTableHeader(int index, OrderLineItem currentItem, int mainIndex,
      BuildContext context) {
    final String _headerText = index == 0
        ? currentItem.order.terms.period
        : index == 1
            ? currentItem.catalogSlide.content.description
            : index == 2
                ? currentItem.item.id.unicity
                : index == 3
                    ? Parsing.stringFrom(
                        mainIndex == 0 ? "PV" : currentItem.terms.pvEach)
                    : Parsing.stringFrom(mainIndex == 0
                        ? "Price"
                        : currentItem.terms.priceEach.toInt());
    return Text(_headerText,
        style: mainIndex != 0
            ? Theme.of(context).textTheme.tableData
            : Theme.of(context).textTheme.tableHeader);
  }
}
