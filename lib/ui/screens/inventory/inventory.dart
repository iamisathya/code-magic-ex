import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/activity_indicators.dart';
import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
import 'package:flutter/material.dart';

class InventoryHomeScreen extends StatefulWidget {
  static const String routeName = '/inventoryHomePage';

  @override
  _InventoryHomeScreenState createState() => _InventoryHomeScreenState();
}

class _InventoryHomeScreenState extends State<InventoryHomeScreen> {
  @override
  void initState() {
    super.initState();
    inventoryBLoc.getInventoryRecords(context);
  }

  @override
  Widget build(BuildContext context) {
    @override
    List<Widget> _buildCells(InventoryRecords inventoryRecords) {
      return List.generate(
        inventoryRecords.items.length,
        (index) => Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.white,
          margin: const EdgeInsets.all(4.0),
          child: Text(inventoryRecords.items[index].item.id.unicity,
              style: Theme.of(context).textTheme.bodyText1),
        ),
      );
    }

    List<Widget> _buildRows(InventoryRecords inventoryRecords) {
      return List.generate(
        inventoryRecords.items.length,
        (index) => Row(
          children: _buildCells(inventoryRecords),
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
                      children: _buildCells(snapshot.data!),
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
