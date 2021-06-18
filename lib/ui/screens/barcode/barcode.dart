import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:flutter/material.dart';

class BarcodeHomeScreen extends StatefulWidget {
  static const String routeName = '/barcodeHomePage';

  @override
  _BarcodeHomeScreenState createState() => _BarcodeHomeScreenState();
}

class _BarcodeHomeScreenState extends State<BarcodeHomeScreen> {
  TextEditingController searchConntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BarCode"),
        ),
        drawer: NavigationDrawer(),
        body: Container(child: _buildSearchContainer(),));
  }

  Widget _buildSearchContainer() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Flexible(child: SearchViewWidget(controller: searchConntroller)),
          MaterialButton(
            shape: RoundedRectangleBorder(
                side: const BorderSide(),
                borderRadius: BorderRadius.circular(8)),
            disabledColor: Colors.grey,
            color: Colors.yellow,
            onPressed: () {},
            height: 55,
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
