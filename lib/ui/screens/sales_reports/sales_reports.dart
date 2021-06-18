import 'package:code_magic_ex/resources/colors.dart';
import 'package:code_magic_ex/ui/screens/github/empty_result_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_error_widget.dart';
import 'package:code_magic_ex/ui/screens/github/search_loading_widget.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/bloc.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/widgets/search_view.dart';
import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:intl/intl.dart';

class SalesReportsHomeScreen extends StatefulWidget {
  static const String routeName = '/salesReportsHomePage';

  @override
  _SalesReportsHomeScreenState createState() => _SalesReportsHomeScreenState();
}

class _SalesReportsHomeScreenState extends State<SalesReportsHomeScreen> {
  final _searchview = TextEditingController();
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  bool sort = false;

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
            child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Theme(
                          data: _renderThemeData(),
                          child: TextField(
                            controller: _startDate,
                            readOnly: true,
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  onConfirm: (date) {
                                _startDate.text = DateFormat('dd-MM-yyyy')
                                    .format(date)
                                    .toString();
                              });
                            },
                            decoration: _renderInputDecoration(
                                "Select from date", "From"),
                          )),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Theme(
                          data: _renderThemeData(),
                          child: TextField(
                            controller: _endDate,
                            readOnly: true,
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  onConfirm: (date) {
                                _endDate.text = DateFormat('dd-MM-yyyy')
                                    .format(date)
                                    .toString();
                              }, currentTime: DateTime.now());
                            },
                            decoration:
                                _renderInputDecoration("Select to date", "To"),
                          )),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.black,
                    ),
                    tooltip: 'Theme selector',
                    onPressed: () => _showPopupMenu(context),
                  ),
                ],
              ),
            ),
            StreamBuilder<SalesReportPageState>(
                stream: salesReportBloc.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(child: _buildChild(snapshot.data!));
                  }
                  return const Text("No data yet");
                })
          ],
        )));
  }

  Widget _buildChild(SalesReportPageState state) {
    if (state.isLoading) {
      return const LoadingWidget();
    } else if (state.hasError) {
      return const SearchErrorWidget();
    } else if (state.ordersAndRMAs.items.isEmpty) {
      return const EmptyWidget();
    } else {
      return Text("hi");
    }
    // throw Exception('${state.runtimeType} is not supported');
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 182, 0, 100),
      items: [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "EN",
          child: ListTile(
            selected: true,
            selectedTileColor: Colors.blue,
            title: const Text("By Order"),
            onTap: () => {print("ji")},
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "TH",
          child: ListTile(
            selectedTileColor: AppColor.COLOR_399000,
            title: const Text("By Item"),
            onTap: () => {print("ji")},
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          value: "TH",
          child: ListTile(
            selectedTileColor: AppColor.COLOR_399000,
            title: const Text("RMAs"),
            onTap: () => {print("ji")},
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  ThemeData _renderThemeData() {
    return ThemeData(
      primaryColor: Colors.redAccent,
      primaryColorDark: Colors.red,
    );
  }

  InputDecoration _renderInputDecoration(String hintText, String label) {
    return InputDecoration(
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
      hintText: hintText,
      labelText: label,
      prefixIcon: const Icon(
        Icons.calendar_today,
        color: Colors.blue,
      ),
    );
  }

  SingleChildScrollView _renderInventoryTable(
      AsyncSnapshot<InventoryRecords> snapshot) {
    final String totalPrice = _calculateTotalPrice(snapshot.data!, 'price');
    final String totalPv = _calculateTotalPrice(snapshot.data!, 'pv');
    return SingleChildScrollView(
      child: Column(
        children: [
          _renderToolBar(),
          SingleChildScrollView(
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
              rows: snapshot.data!
                  .items // Loops through dataColumnText, each iteration assigning the value to element
                  .map(
                    (element) => DataRow(
                      cells: <DataCell>[
                        _renderDataCell(element.item.id.unicity.toString()),
                        DataCell(Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              element.catalogSlideContent.content.description),
                        )),
                        _renderDataCell(element.terms.pvEach.toString()),
                        _renderDataCell(Parsing.intFrom(element.terms.priceEach)
                            .toString()),
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
        ],
      ),
    );
  }

  Widget _renderToolBar() {
    return Row(
      children: [
        Expanded(child: _createSearchView()),
        IconButton(
            onPressed: () => inventoryBLoc.getInventoryRecords(context),
            icon: const Icon(Icons.refresh_outlined)),
        const IconButton(
            onPressed: null, icon: Icon(Icons.file_upload_outlined)),
        const IconButton(onPressed: null, icon: Icon(Icons.print_outlined)),
      ],
    );
  }

  //Create a SearchView
  Widget _createSearchView() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: StreamBuilder<Object>(
          stream: inventoryBLoc.getSearchTextStream,
          builder: (context, snapshot) {
            _searchview.text = snapshot.data.toString();
            _searchview.selection = TextSelection.fromPosition(
                TextPosition(offset: _searchview.text.length));
            return TextField(
              onChanged: (value) => inventoryBLoc.onTextSearchChange(value),
              cursorColor: Colors.grey[300],
              controller: _searchview,
              decoration: InputDecoration(
                hintText: "Search",
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
            );
          }),
    );
  }

  DataColumn _renderDataColomn(String title,
      AsyncSnapshot<InventoryRecords> snapshot, BuildContext context) {
    return DataColumn(
      numeric: title != "Item Code" && title != "Item Name",
      onSort: (columnIndex, ascending) {
        setState(() {
          sort = !sort;
        });
        _onSortColum(snapshot.data!.items, columnIndex, !sort);
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
