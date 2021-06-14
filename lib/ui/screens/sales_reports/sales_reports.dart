import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:flutter/material.dart';

class SalesReportsHomeScreen extends StatefulWidget {
  static const String routeName = '/salesReportsHomePage';

  @override
  _SalesReportsHomeScreenState createState() => _SalesReportsHomeScreenState();
}

class _SalesReportsHomeScreenState extends State<SalesReportsHomeScreen> {
  @override
  void initState() { 
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildCells(int count) {
      return List.generate(
        count,
        (index) => Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 60.0,
          color: Colors.white,
          margin: const EdgeInsets.all(4.0),
          child: Text("${index + 1}", style: Theme.of(context).textTheme.bodyText1),
        ),
      );
    }

    List<Widget> _buildRows(int count) {
      return List.generate(
        count,
        (index) => Row(
          children: _buildCells(10),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildCells(20),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildRows(20),
                ),
              ),
            )
          ],
        )));
  }
}
