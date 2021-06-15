import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/widgets/activity_indicators.dart';
import 'package:code_magic_ex/ui/global/widgets/empty_result_widget.dart';
import 'package:code_magic_ex/ui/global/widgets/search_error_widget.dart';
import 'package:code_magic_ex/ui/global/widgets/search_intro_widget.dart';
import 'package:code_magic_ex/ui/global/widgets/search_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
import 'package:code_magic_ex/ui/screens/inventory/search_bloc.dart';
import 'package:code_magic_ex/ui/screens/inventory/search_state.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Example._title,
      home: Scaffold(
        appBar: AppBar(title: const Text(Example._title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  bool sort = false;
  late SearchBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SearchBloc();
    bloc.onViewLaunch.add(true);
    // inventoryBLoc.getInventoryRecords(context);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchState>(
        stream: bloc.state,
        initialData: SearchNoTerm(),
        builder: (BuildContext context, AsyncSnapshot<SearchState> snapshot) {
          final state = snapshot.data;
          return SingleChildScrollView(
            child: _buildChild(state!),
          );
        });
  }

  SingleChildScrollView _renderInventoryTable(InventoryRecords snapshot,
      BuildContext context, String totalPrice, String totalPv) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 60,
          headingRowColor: MaterialStateProperty.all(Colors.lightBlue[600]),
          headingTextStyle: const TextStyle(color: Colors.white),
          headingRowHeight: 60,
          dividerThickness: 1,
          showBottomBorder: true,
          sortAscending: sort,
          sortColumnIndex: 0,
          columns: <DataColumn>[
            _renderDataColomn("Item Code", snapshot, context),
            _renderDataColomn("Item Name", snapshot, context),
            _renderDataColomn("PV", snapshot, context),
            _renderDataColomn("Price", snapshot, context),
            _renderDataColomn("Quantity on hand", snapshot, context),
            _renderDataColomn(
                "Total Accumulated Price $totalPrice", snapshot, context),
            _renderDataColomn("Total PV $totalPv", snapshot, context),
          ],
          rows: snapshot
              .items // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                (element) => DataRow(
                  cells: <DataCell>[
                    _renderDataCell(element.item.id.unicity.toString()),
                    DataCell(Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text(element.catalogSlideContent.content.description),
                    )),
                    _renderDataCell(element.terms.pvEach.toString()),
                    _renderDataCell(
                        Parsing.intFrom(element.terms.priceEach).toString()),
                    _renderDataCell(element.quantityOnHand.toString()),
                    _renderDataCell(_calculateEachTotal(
                        element.quantityOnHand, element.terms.priceEach)),
                    _renderDataCell(_calculateTotalPv(
                        element.quantityOnHand, element.terms.pvEach)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildChild(SearchState state) {
    if (state is SearchNoTerm) {
      return const SearchIntro();
    } else if (state is SearchEmpty) {
      return const EmptyWidget();
    } else if (state is SearchLoading) {
      return const LoadingWidget();
    } else if (state is SearchError) {
      return const SearchErrorWidget();
    } else if (state is SearchPopulated) {
      final String totalPrice =
          _calculateTotalPrice(state.inventoryRecords, 'price');
      final String totalPv = _calculateTotalPrice(state.inventoryRecords, 'pv');
      return _renderInventoryTable(
          state.inventoryRecords, context, totalPrice, totalPv);
    }

    throw Exception('${state.runtimeType} is not supported');
  }

  DataColumn _renderDataColomn(
      String title, InventoryRecords snapshot, BuildContext context) {
    return DataColumn(
      numeric: title != "Item Code" && title != "Item Name",
      onSort: (columnIndex, ascending) {
        setState(() {
          sort = !sort;
        });
        _onSortColum(snapshot.items, columnIndex, !sort);
      },
      label: Center(
        child: Text(
          title,
        ),
      ),
    );
  }

  String _calculateTotalPrice(InventoryRecords inventoryRecords, String type) {
    double total = 0.0;
    // looping over data array
    for (final item in inventoryRecords.items) {
      total += Parsing.intFrom(item.quantityOnHand)! *
          (type == "pv" ? item.terms.pvEach : item.terms.priceEach);
    }
    return total.toInt().toString();
  }

  DataCell _renderDataCell(String value) => DataCell(Text(value));

  void _onSortColum(List<InventoryRecordItems> inventoryRecordItems,
      int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        inventoryRecordItems
            .sort((a, b) => a.item.id.unicity.compareTo(b.item.id.unicity));
      } else {
        inventoryRecordItems
            .sort((a, b) => b.item.id.unicity.compareTo(a.item.id.unicity));
      }
    } else if (columnIndex == 1) {
      if (ascending) {
        inventoryRecordItems.sort((a, b) => a
            .catalogSlideContent.content.description
            .compareTo(b.catalogSlideContent.content.description));
      } else {
        inventoryRecordItems.sort((a, b) => b
            .catalogSlideContent.content.description
            .compareTo(a.catalogSlideContent.content.description));
      }
    } else if (columnIndex == 2) {
      if (ascending) {
        inventoryRecordItems
            .sort((a, b) => a.terms.pvEach.compareTo(b.terms.pvEach));
      } else {
        inventoryRecordItems
            .sort((a, b) => b.terms.pvEach.compareTo(a.terms.pvEach));
      }
    } else if (columnIndex == 3) {
      if (ascending) {
        inventoryRecordItems
            .sort((a, b) => a.terms.priceEach.compareTo(b.terms.priceEach));
      } else {
        inventoryRecordItems
            .sort((a, b) => b.terms.priceEach.compareTo(a.terms.priceEach));
      }
    }
  }

  String _calculateEachTotal(String qty, double unitPrice) {
    final int? parsedQty = Parsing.intFrom(qty);
    return (parsedQty! * unitPrice).toInt().toString();
  }

  String _calculateTotalPv(String qty, int unitPv) {
    final int? parsedQty = Parsing.intFrom(qty);
    return (parsedQty! * unitPv).toInt().toString();
  }
}
