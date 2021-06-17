import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/state.dart';
import 'package:code_magic_ex/ui/screens/github/empty_result_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_loading_widget.dart';

import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/bloc.dart';

import 'package:code_magic_ex/utilities/extensions.dart';

class EasyShipHomeScreen extends StatefulWidget {
  static const String routeName = '/easyShipReportsHomePage';

  @override
  _EasyShipHomeScreenState createState() => _EasyShipHomeScreenState();
}

class _EasyShipHomeScreenState extends State<EasyShipHomeScreen> {
  var searchConntroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    easyShipBloc.loadOrderlines(userId: "3011266");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Easy ship reports"),
          actions: const <Widget>[
            IconButton(
              icon: Icon(
                Icons.print_outlined,
                color: Colors.white,
              ),
              onPressed: null,
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: Center(
          child: SingleChildScrollView(
              child: Column(children: [
            _buildSeachConntainer(),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StreamBuilder<Object>(
                    stream: easyShipBloc.state,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final EasyShipState state =
                            snapshot.data as EasyShipState;
                        return _buildChild(state);
                      }
                      return const Text("No data yet");
                    }))
          ])),
        ));
  }

  Widget _buildChild(EasyShipState state) {
    if (state.isLoading) {
      return const LoadingWidget();
    } else if (state.hasError) {
      return const SearchErrorWidget();
    } else if (state.orderLines.items.isEmpty) {
      return const EmptyWidget();
    } else {
      return _renderEasyShipTable(state.orderLines);
    }
    // throw Exception('${state.runtimeType} is not supported');
  }

  Widget _buildSeachConntainer() {
    return Row(
      children: [
        Flexible(child: SearchViewWidget(controller: searchConntroller)),
        MaterialButton(
          padding: const EdgeInsets.all(8),
          color: Colors.yellow,
            onPressed: () {},
            child: const Text('Search'),
          ),
      ],
    );
  }

  DataTable _renderEasyShipTable(OrderLines orderLines) {
    return DataTable(
      dataRowHeight: 60,
      headingRowColor: MaterialStateProperty.all(Colors.lightBlue[600]),
      headingTextStyle: const TextStyle(color: Colors.white),
      headingRowHeight: 60,
      dividerThickness: 1,
      showBottomBorder: true,
      sortColumnIndex: 0,
      columns: <DataColumn>[
        _renderDataColomn("Order Number"),
        _renderDataColomn("Period"),
        _renderDataColomn("Product Name"),
        _renderDataColomn("Item Code"),
        _renderDataColomn("PV"),
        _renderDataColomn("Price"),
      ],
      rows: orderLines
          .items // Loops through dataColumnText, each iteration assigning the value to element
          .map(
            (element) => DataRow(
              cells: <DataCell>[
                _renderDataCell(element.order.id.unicity.retrieveOrderId()),
                _renderDataCell(element.order.terms.period),
                _renderDataCell(element.catalogSlide.content.description),
                _renderDataCell(element.item.id.unicity.toString()),
                _renderDataCell(element.terms.pvEach.toString()),
                _renderDataCell(element.terms.priceEach.asReadableString)
              ],
            ),
          )
          .toList(),
    );
  }

  DataCell _renderDataCell(String value) => DataCell(Text(value));

  DataColumn _renderDataColomn(String title) {
    return DataColumn(
      label: Center(
        child: Text(
          title,
        ),
      ),
    );
  }
}
