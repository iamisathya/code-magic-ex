import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/ui/screens/github/custom_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/github/empty_result_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/open_po/bloc.dart';
import 'package:code_magic_ex/ui/screens/open_po/state.dart';
import 'package:code_magic_ex/ui/screens/webview/webview.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:code_magic_ex/utilities/extensions.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    openPoBloc.getAllOpenPo();
  }

  List<Widget> _buildMainCells(List<OpenPO> items, BuildContext context) {
    final int totalLength = items.length;
    return List.generate(
      totalLength,
      (index) => InkWell(
        child: Container(
          alignment: Alignment.center,
          width: 180.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: index == 0 ? kPrimaryColor : Colors.white,
            border: Border.all(width: 0.5),
          ),
          child: Text(items[index].orderOpid,
              style: index == 0
                  ? Theme.of(context).textTheme.button
                  : Theme.of(context).textTheme.bodyText2),
        ),
      ),
    );
  }

  List<Widget> _buildCells(
      int mainIndex, List<OpenPO> items, BuildContext context) {
    return List.generate(6, (index) {
      final OpenPO currentItem = items[mainIndex];
      return Container(
        alignment: Alignment.center,
        width: 160,
        height: 60.0,
        decoration: BoxDecoration(
          color: mainIndex == 0 ? kPrimaryColor : Colors.white,
          border: Border.all(width: 0.5),
        ),
        child: index == 5
            ? mainIndex == 0
                ? (Text(
                    index == 0
                        ? currentItem.orderDscid
                        : index == 1
                            ? currentItem.orderDate
                            : index == 2
                                ? currentItem.orderTime
                                : index == 3
                                    ? currentItem.orderTotalPrice
                                    : index == 4
                                        ? currentItem.orderTotalPv
                                        : currentItem.iconAttachment,
                    style: mainIndex == 0
                        ? Theme.of(context).textTheme.button
                        : Theme.of(context).textTheme.bodyText2))
                : (currentItem.iconAttachment != "1_0_0"
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebivewHomeScreen(
                                  url: "${Address.resource}${currentItem.iconAttachment.retrieveAttachementName()}",
                                ),
                              ));
                        },
                        icon:
                            const Icon(Icons.attach_file, color: kPrimaryColor))
                    : const SizedBox())
            : Text(
                index == 0
                    ? currentItem.orderDscid
                    : index == 1
                        ? currentItem.orderDate
                        : index == 2
                            ? currentItem.orderTime
                            : index == 3
                                ? currentItem.orderTotalPrice
                                : index == 4
                                    ? currentItem.orderTotalPv
                                    : currentItem.iconAttachment,
                style: mainIndex == 0
                    ? Theme.of(context).textTheme.button
                    : Theme.of(context).textTheme.bodyText2),
      );
    });
  }

  List<Widget> _buildRows(List<OpenPO> items, BuildContext context) {
    return List.generate(
      items.length,
      (index) => Row(
        children: _buildCells(index, items, context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: StreamBuilder<OpenPoState>(
            stream: openPoBloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.hasError == false) {
                return _buildChild(snapshot.data!, context);
              } else {
                return const SearchErrorWidget();
              }
            }));
  }

  Widget _buildChild(OpenPoState state, BuildContext context) {
    if (state.isLoading) {
      return const CustomLoadingWidget(svgIcon: 'assets/images/completed_tasks.svg',);
    } else if (state.hasError) {
      return const SearchErrorWidget();
    } else if (state.openPO.isEmpty) {
      return const EmptyWidget();
    } else {
      return _renderDataTable(state.openPO, context);
    }
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
