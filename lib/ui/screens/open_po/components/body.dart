import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/ui/screens/github/empty_result_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/open_po/bloc.dart';
import 'package:code_magic_ex/ui/screens/open_po/state.dart';
import 'package:flutter/material.dart';

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
          width: 160.0,
          height: 60.0,
          decoration: BoxDecoration(
              border: Border.all(),
              color: index == 0 ? Colors.lightBlue[700] : Colors.white),
          margin: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Item Code",
                  style: index == 0
                      ? Theme.of(context).textTheme.subtitle2
                      : Theme.of(context).textTheme.subtitle1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_drop_up),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCells(int mainIdex, List<OpenPO> items, String type,
      double totalPrice, double totalPv, BuildContext context) {
    final int totalLength = items.length + 1;
    final List<Map<String, dynamic>> mainHeaders = [
      {"name": "Item Name", "width": 360.0},
      {"name": "PV", "width": 120.0},
      {"name": "Price", "width": 120.0},
      {"name": "Quantity on hand", "width": 240.0},
      {"name": "Total Accumulated Price $totalPrice", "width": 360.0},
      {"name": "Total PV $totalPv", "width": 240.0},
    ];
    return List.generate(
      type == "main" ? totalLength : 6,
      (index) => Container(
        alignment: Alignment.center,
        width: double.parse(mainHeaders[index]["width"].toString()),
        height: 60.0,
        margin: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            border: Border.all(),
            color: mainIdex == 0 ? Colors.lightBlue[700] : Colors.white),
        child: Text("name",
            style: mainIdex == 0
                ? Theme.of(context).textTheme.subtitle2
                : Theme.of(context).textTheme.subtitle1),
      ),
    );
  }

  List<Widget> _buildRows(List<OpenPO> items, BuildContext context) {
    double totalPrice = 0.0;
    // looping over data array
    for (final item in items) {
      totalPrice += int.parse(item.orderTotalPrice);
    }
    double totalPv = 0.0;
    // looping over data array
    for (final item in items) {
      totalPv += int.parse(item.orderTotalPv);
    }
    return List.generate(
      items.length,
      (index) => Row(
        children:
            _buildCells(index, items, "sub", totalPrice, totalPv, context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: StreamBuilder<OpenPoState>(
            stream: openPoBloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildChild(snapshot.data!, context);
              } else {
                return const SearchErrorWidget();
              }
            }));
  }

  Widget _buildChild(OpenPoState state, BuildContext context) {
    if (state.isLoading) {
      return const LoadingWidget();
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
