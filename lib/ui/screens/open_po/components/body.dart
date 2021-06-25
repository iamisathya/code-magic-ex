import 'package:code_magic_ex/ui/screens/open_po/bloc/bloc.dart';
import 'package:code_magic_ex/ui/screens/open_po/components/partner_order_details.dart';
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

class Body extends StatelessWidget {
  final SampleController controller = Get.put(SampleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SampleController>(
          init: SampleController(),
          initState: (state) {
            controller.getAllOpenPo();
          },
          builder: (_) {
            if (controller.showDetails.value) {
              return _buildDetailsContainer(context);
            }
            return _buildChild(context);
          }),
    );
  }

  Widget _buildDetailsContainer(BuildContext context) {
    if (controller.loadingDetails.value) {
      return const CustomLoadingWidget(
        svgIcon: kImageApproveTask,
      );
    }
    return PurchaseOrderDetailsPage();
  }

  Widget _buildChild(BuildContext context) {
    if (controller.loading.value) {
      return const CustomLoadingWidget(
        svgIcon: kImageCompletedTask,
      );
    } else if (controller.errorMessage.value.isNotEmpty) {
      return const CustomErrorWidget(
        svgIcon: kImageServerDown,
      );
    } else if (controller.allOpenPlaceOrders.isEmpty) {
      return const CustomEmptyWidget(
        svgIcon: kImageEmptyBox,
      );
    } else {
      return _renderDataTable(controller.allOpenPlaceOrders, context);
    }
  }

  List<Widget> _buildMainCells(List<OpenPO> items, BuildContext context) {
    final int totalLength = items.length;
    return List.generate(
      totalLength,
      (index) => GestureDetector(
        onTap: () {
          controller.getOpenPlaceOrderDetails(items[index].orderOpid, context);
        },
        child: Container(
          alignment: Alignment.center,
          width: 180.0,
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
            items[index].orderOpid,
            style: index != 0
                ? Theme.of(context).textTheme.tableData
                : Theme.of(context).textTheme.tableHeader,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCells(
      int mainIndex, List<OpenPO> items, BuildContext context) {
    return List.generate(6, (index) {
      final OpenPO currentItem = items[mainIndex];
      return GestureDetector(
        onTap: () {
          controller.getOpenPlaceOrderDetails(
              items[mainIndex].orderOpid, context);
        },
        child: Container(
          alignment: Alignment.center,
          width: 160,
          height: 60.0,
          decoration: BoxDecoration(
            color: mainIndex == 0
                ? kPrimaryLightColor
                : mainIndex.isEven
                    ? kWhiteSmokeColor
                    : Colors.white,
            border: Border.all(width: 0.5),
          ),
          child: index == 4
              ? mainIndex == 0
                  ? _renderTableHeader(index, currentItem, mainIndex, context)
                  : _renderStatusButton(
                      context, currentItem.orderStatus.retrieveOrderStatus())
              : index == 5
                  ? mainIndex == 0
                      ? _renderTableHeader(
                          index, currentItem, mainIndex, context)
                      : (currentItem.iconAttachment != "1_0_0"
                          ? IconButton(
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
                              icon: const Icon(Icons.attach_file,
                                  color: kPrimaryLightColor))
                          : const SizedBox())
                  : _renderTableHeader(index, currentItem, mainIndex, context),
        ),
      );
    });
  }

  Container _renderStatusButton(BuildContext context, String status) {
    if (status == "0") {
      _renderEachStatusButton(context, "Pending", kTernaryLightColor);
    } else if (status == "4") {
      return _renderEachStatusButton(context, "Approved", kPrimaryColor);
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

  Text _renderTableHeader(
      int index, OpenPO currentItem, int mainIndex, BuildContext context) {
    final String _headerText = index == 0
        ? currentItem.orderDate
        : index == 1
            ? currentItem.orderTime
            : index == 2
                ? currentItem.orderTotalPrice
                : index == 3
                    ? currentItem.orderTotalPv
                    : index == 4
                        ? currentItem.orderStatus
                        : currentItem.iconAttachment;
    return Text(_headerText,
        style: mainIndex != 0
            ? Theme.of(context).textTheme.tableData
            : Theme.of(context).textTheme.tableHeader);
  }

  List<Widget> _buildRows(List<OpenPO> items, BuildContext context) {
    return List.generate(
      items.length,
      (index) => Row(
        children: _buildCells(index, items, context),
      ),
    );
  }

  SingleChildScrollView _renderDataTable(
      List<OpenPO> items, BuildContext context) {
    return SingleChildScrollView(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildMainCells(items, context),
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRows(items, context),
            ),
          ),
        )
      ],
    ));
  }
}
