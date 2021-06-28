import 'package:flutter/material.dart';

class ScrollableTable extends StatelessWidget {
  static const String routeName = '/easyShipReportsHomePage';

  List<Widget> _buildCells(int count, BuildContext context) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        color: Colors.white,
        margin: const EdgeInsets.all(4.0),
        child: Text("${index + 1}", style: Theme.of(context).textTheme.button),
      ),
    );
  }

  List<Widget> _buildRows(int count, BuildContext context) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(10, context),
      ),
    );
  }

  List<Widget> _buildCells2(int count, BuildContext context) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        color: Colors.white,
        margin: const EdgeInsets.all(4.0),
        child: Text("${index + 1}", style: Theme.of(context).textTheme.button),
      ),
    );
  }

  List<Widget> _buildRows2(int count, BuildContext context) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells2(10, context),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildCells2(1, context),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildRows2(1, context),
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildCells(20, context),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildRows(20, context),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
