import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/activity_indicators.dart';
import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
import 'package:flutter/material.dart';

class InventoryHomeScreen extends StatefulWidget {
  static const String routeName = '/inventoryHomePage1';

  @override
  _InventoryHomeScreenState createState() => _InventoryHomeScreenState();
}

class _InventoryHomeScreenState extends State<InventoryHomeScreen> {
  @override
  void initState() {
    super.initState();
    inventoryBLoc.getInventoryRecords(context);
  }

  String _buildText(int index, InventoryRecordItems item) {
    dynamic stringValue = "";
    switch (index) {
      case 0:
        stringValue = item.catalogSlideContent.content.description;
        break;
      case 1:
        stringValue = item.terms.pvEach;
        break;
      case 2:
        stringValue = item.terms.priceEach;
        break;
      case 3:
        stringValue = item.quantityOnHand;
        break;
      case 4:
        stringValue = item.terms.priceEach * int.parse(item.quantityOnHand);
        break;
      case 5:
        stringValue = item.terms.pvEach * int.parse(item.quantityOnHand);
        break;
      default:
    }
    return stringValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    @override
    List<Widget> _buildCells(int mainIdex, InventoryRecords inventoryRecords,
        String type, double totalPrice, double totalPv) {
      final int totalLength = inventoryRecords.items.length + 1;
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
          child: Text(
              mainIdex == 0
                  ? mainHeaders[index]["name"].toString()
                  : _buildText(index, inventoryRecords.items[mainIdex - 1]),
              style: mainIdex == 0
                  ? Theme.of(context).textTheme.subtitle2
                  : Theme.of(context).textTheme.subtitle1),
        ),
      );
    }

    @override
    List<Widget> _buildMainCells(InventoryRecords inventoryRecords) {
      final int totalLength = inventoryRecords.items.length;
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
                Text(
                    index == 0
                        ? "Item Code"
                        : inventoryRecords.items[index - 1].item.id.unicity,
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

    List<Widget> _buildRows(InventoryRecords inventoryRecords) {
      double totalPrice = 0.0;
      // looping over data array
      for (final item in inventoryRecords.items) {
        totalPrice += item.terms.priceEach;
      }
      double totalPv = 0.0;
      // looping over data array
      for (final item in inventoryRecords.items) {
        totalPv += item.terms.pvEach;
      }
      return List.generate(
        inventoryRecords.items.length,
        (index) => Row(
          children:
              _buildCells(index, inventoryRecords, "sub", totalPrice, totalPv),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Sales Reports"),
        ),
        drawer: NavigationDrawer(),
        body: StreamBuilder<InventoryRecords>(
            stream: inventoryBLoc.appInventoryStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildMainCells(snapshot.data!),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildRows(snapshot.data!),
                        ),
                      ),
                    )
                  ],
                ));
              } else {
                return ActivityIndicator(
                    loadingStream: inventoryBLoc.activityIndicatorStream);
              }
            }));
  }
}
