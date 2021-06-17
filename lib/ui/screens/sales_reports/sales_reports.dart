import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
import 'package:flutter/material.dart';

class SalesReportsHomeScreen extends StatefulWidget {
  static const String routeName = '/salesReportsHomePage';

  @override
  _SalesReportsHomeScreenState createState() => _SalesReportsHomeScreenState();
}

class _SalesReportsHomeScreenState extends State<SalesReportsHomeScreen> {
  final _searchview = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
            child: SearchViewWidget(
                getSearchTextStream: inventoryBLoc.getSearchTextStream,
                searchviewController: _searchview)));
  }
}
