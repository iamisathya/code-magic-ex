// import 'package:code_magic_ex/models/order_list_rmas.dart';
// import 'package:code_magic_ex/ui/screens/github/empty_result_widget.dart';
// import 'package:code_magic_ex/ui/screens/github/search_error_widget.dart';
// import 'package:code_magic_ex/ui/screens/github/search_loading_widget.dart';
// import 'package:code_magic_ex/ui/screens/sales_reports/bloc.dart';
// import 'package:code_magic_ex/ui/screens/sales_reports/state.dart';
// import 'package:code_magic_ex/utilities/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
// import 'package:code_magic_ex/ui/screens/inventory/bloc.dart';
// import 'package:code_magic_ex/utilities/core/parsing.dart';
// import 'package:intl/intl.dart';

// import 'package:code_magic_ex/utilities/extensions.dart';

// class SalesReportsHomeScreen extends StatefulWidget {
//   static const String routeName = '/salesReportsHomePage';

//   @override
//   _SalesReportsHomeScreenState createState() => _SalesReportsHomeScreenState();
// }

// class _SalesReportsHomeScreenState extends State<SalesReportsHomeScreen> {
//   final _searchview = TextEditingController();
//   final _startDate = TextEditingController();
//   final _endDate = TextEditingController();
//   bool sort = false;

//   @override
//   void initState() {
//     super.initState();
//     salesReportBloc.loadSalesReports();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Home"),
//         ),
//         drawer: NavigationDrawer(),
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             Container(
//               margin:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//               child: Row(
//                 children: [
//                   Flexible(
//                     child: Container(
//                       margin: const EdgeInsets.only(right: 4),
//                       child: Theme(
//                           data: _renderThemeData(),
//                           child: TextField(
//                             controller: _startDate,
//                             readOnly: true,
//                             onTap: () {
//                               DatePicker.showDatePicker(context,
//                                   onConfirm: (date) {
//                                 _startDate.text = DateFormat('dd-MM-yyyy')
//                                     .format(date)
//                                     .toString();
//                               });
//                             },
//                             decoration: _renderInputDecoration(
//                                 "Select from date", "From"),
//                           )),
//                     ),
//                   ),
//                   Flexible(
//                     child: Container(
//                       margin: const EdgeInsets.only(left: 4),
//                       child: Theme(
//                           data: _renderThemeData(),
//                           child: TextField(
//                             controller: _endDate,
//                             readOnly: true,
//                             onTap: () {
//                               DatePicker.showDatePicker(context,
//                                   onConfirm: (date) {
//                                 _endDate.text = DateFormat('dd-MM-yyyy')
//                                     .format(date)
//                                     .toString();
//                               }, currentTime: DateTime.now());
//                             },
//                             decoration:
//                                 _renderInputDecoration("Select to date", "To"),
//                           )),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.sort,
//                       color: Colors.black,
//                     ),
//                     tooltip: 'Theme selector',
//                     onPressed: () => _showPopupMenu(context),
//                   ),
//                 ],
//               ),
//             ),
//             StreamBuilder<SalesReportPageState>(
//                 stream: salesReportBloc.state,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Container(child: _buildChild(snapshot.data!));
//                   }
//                   return const Text("No data yet");
//                 })
//           ],
//         )));
//   }

//   Widget _buildChild(SalesReportPageState state) {
//     if (state.isLoading) {
//       return const LoadingWidget();
//     } else if (state.hasError) {
//       return const SearchErrorWidget();
//     } else if (state.ordersAndRMAs.orders.isEmpty) {
//       return const EmptyWidget();
//     } else {
//       return _renderInventoryTable(state.ordersAndRMAs.orders[0]);
//     }
//     // throw Exception('${state.runtimeType} is not supported');
//   }

//   Future<void> _showPopupMenu(BuildContext context) async {
//     await showMenu(
//       context: context,
//       position: const RelativeRect.fromLTRB(100, 182, 0, 100),
//       items: [
//         const PopupMenuItem<String>(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           value: "EN",
//           child: ListTile(
//             selected: true,
//             selectedTileColor: Colors.blue,
//             title: Text("By Order"),
//           ),
//         ),
//         const PopupMenuItem<String>(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           value: "TH",
//           child: ListTile(
//             selectedTileColor: kPrimaryColor,
//             title: Text("By Item"),
//           ),
//         ),
//         const PopupMenuItem<String>(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           value: "TH",
//           child: ListTile(
//             selectedTileColor: kPrimaryColor,
//             title: Text("RMAs"),
//           ),
//         )
//       ],
//       elevation: 8.0,
//     );
//   }

//   ThemeData _renderThemeData() {
//     return ThemeData(
//       primaryColor: Colors.redAccent,
//       primaryColorDark: Colors.red,
//     );
//   }

//   InputDecoration _renderInputDecoration(String hintText, String label) {
//     return InputDecoration(
//       border:
//           const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
//       hintText: hintText,
//       labelText: label,
//       prefixIcon: const Icon(
//         Icons.calendar_today,
//         color: Colors.blue,
//       ),
//     );
//   }

//   SingleChildScrollView _renderInventoryTable(AllOrders orders) {
//     final String totalPrice = _calculateTotalPrice(orders, 'price');
//     final String totalPv = _calculateTotalPrice(orders, 'pv');
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           _renderToolBar(),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//               dataRowHeight: 60,
//               headingRowColor: MaterialStateProperty.all(Colors.lightBlue[600]),
//               headingTextStyle: const TextStyle(color: Colors.white),
//               headingRowHeight: 60,
//               dividerThickness: 1,
//               showBottomBorder: true,
//               sortAscending: sort,
//               sortColumnIndex: 0,
//               columns: <DataColumn>[
//                 _renderDataColomn("Record", orders),
//                 _renderDataColomn("BA Number", orders),
//                 _renderDataColomn("Name", orders),
//                 _renderDataColomn("Order ID", orders),
//                 _renderDataColomn("Date", orders),
//                 _renderDataColomn("Time", orders),
//                 _renderDataColomn("Total Price $totalPrice", orders),
//                 _renderDataColomn("Total PV $totalPv", orders),
//                 _renderDataColomn("Barcode", orders),
//               ],
//               rows: orders
//                   .items // Loops through dataColumnText, each iteration assigning the value to element
//                   .map(
//                     (element) => DataRow(
//                       cells: <DataCell>[
//                         _renderDataCell(element.creator.humanName.fullName),
//                         DataCell(Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                               Parsing.stringFrom(element.customer.id.unicity)),
//                         )),
//                         _renderDataCell(element.customer.humanName.fullName),
//                         _renderDataCell(element.id.unicity.retrieveOrderId()),
//                         _renderDataCell(element.dateCreated.asDDMMYYYY),
//                         _renderDataCell(element.dateCreated.asHHMMA),
//                         _renderDataCell(
//                             Parsing.stringFrom(element.terms.total)),
//                         _renderDataCell(Parsing.stringFrom(element.terms.pv)),
//                         _renderDataCell(""),
//                       ],
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _renderToolBar() {
//     return Row(
//       children: [
//         Expanded(child: _createSearchView()),
//         IconButton(
//             onPressed: () => inventoryBLoc.getInventoryRecords(context),
//             icon: const Icon(Icons.refresh_outlined)),
//         const IconButton(
//             onPressed: null, icon: Icon(Icons.file_upload_outlined)),
//         const IconButton(onPressed: null, icon: Icon(Icons.print_outlined)),
//       ],
//     );
//   }

//   //Create a SearchView
//   Widget _createSearchView() {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//           border: Border.all(),
//           borderRadius: const BorderRadius.all(Radius.circular(8.0))),
//       child: StreamBuilder<Object>(
//           stream: inventoryBLoc.getSearchTextStream,
//           builder: (context, snapshot) {
//             _searchview.text = snapshot.data.toString();
//             _searchview.selection = TextSelection.fromPosition(
//                 TextPosition(offset: _searchview.text.length));
//             return TextField(
//               onChanged: (value) => inventoryBLoc.onTextSearchChange(value),
//               cursorColor: Colors.grey[300],
//               controller: _searchview,
//               decoration: InputDecoration(
//                 hintText: "Search",
//                 focusedBorder: InputBorder.none,
//                 prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                 hintStyle: TextStyle(color: Colors.grey[300]),
//               ),
//             );
//           }),
//     );
//   }

//   DataColumn _renderDataColomn(String title, AllOrders orders) {
//     return DataColumn(
//       numeric: title != "Item Code" && title != "Item Name",
//       onSort: (columnIndex, ascending) {
//         setState(() {
//           sort = !sort;
//         });
//         _onSortColum(orders.items, columnIndex, !sort);
//       },
//       label: Center(
//         child: Text(
//           title,
//         ),
//       ),
//     );
//   }

//   String _calculateTotalPrice(AllOrders orders, String type) {
//     final num total = orders.items
//         .map((e) => type == "pv" ? e.terms.pv : e.terms.total)
//         .reduce((value, element) => value + element);
//     return total.toString();
//     // return orders.items.reduce((value, element) => value + element.terms.total).toString();
//     // double total = 0.0;
//     // // looping over data array
//     // for (final item in orders.items) {
//     //   total += type == "pv" ? item.terms.pv : item.terms.total ;
//     // }
//     // return total.toInt().toString();
//   }

//   DataCell _renderDataCell(String value) => DataCell(Text(value));

//   void _onSortColum(
//       List<OrderItem> inventoryRecordItems, int columnIndex, bool ascending) {
//     if (columnIndex == 0) {
//       if (ascending) {
//         inventoryRecordItems.sort((a, b) => a.creator.humanName.fullName
//             .compareTo(b.creator.humanName.fullName));
//       } else {
//         inventoryRecordItems.sort((a, b) => b.creator.humanName.fullName
//             .compareTo(a.creator.humanName.fullName));
//       }
//     } else if (columnIndex == 1) {
//       if (ascending) {
//         inventoryRecordItems.sort(
//             (a, b) => a.customer.id.unicity.compareTo(b.customer.id.unicity));
//       } else {
//         inventoryRecordItems.sort(
//             (a, b) => b.customer.id.unicity.compareTo(a.customer.id.unicity));
//       }
//     } else if (columnIndex == 2) {
//       if (ascending) {
//         inventoryRecordItems.sort((a, b) => a.customer.humanName.fullName
//             .compareTo(b.customer.humanName.fullName));
//       } else {
//         inventoryRecordItems.sort((a, b) => b.customer.humanName.fullName
//             .compareTo(a.customer.humanName.fullName));
//       }
//     } else if (columnIndex == 3) {
//       if (ascending) {
//         inventoryRecordItems.sort((a, b) => a.id.unicity
//             .retrieveOrderId()
//             .compareTo(b.id.unicity.retrieveOrderId()));
//       } else {
//         inventoryRecordItems.sort((a, b) => b.id.unicity
//             .retrieveOrderId()
//             .compareTo(a.id.unicity.retrieveOrderId()));
//       }
//     }
//   }
// }
