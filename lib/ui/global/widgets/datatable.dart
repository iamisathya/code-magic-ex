import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DataTableClass extends StatefulWidget {
  const DataTableClass({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DataTableClassState createState() => _DataTableClassState();
}

class _DataTableClassState extends State<DataTableClass> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    user.initData(940);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 140,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: user.userInfo.length,
        rowSeparatorWidget: kDivider(),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending: isAscending);
          setState(() {});
        },
        child: _getTitleItemWidget(
            'Record ${sortType == sortName ? (isAscending ? '↓' : '↑') : ''}',
            100),
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          user.sortStatus(isAscending: isAscending);
          setState(() {});
        },
        child: _getTitleItemWidget(
            'Status${sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''}',
            100),
      ),
      _getTitleItemWidget('Phone', 200),
      _getTitleItemWidget('Register', 100),
      _getTitleItemWidget('Termination', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 140,
      height: 65,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(user.userInfo[index].name),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 65,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Icon(
                  user.userInfo[index].status
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                  color:
                      user.userInfo[index].status ? Colors.red : Colors.green),
              Text(user.userInfo[index].status ? 'Disabled' : 'Active')
            ],
          ),
        ),
        Container(
          width: 200,
          height: 65,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(user.userInfo[index].phone),
        ),
        Container(
          width: 100,
          height: 65,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(user.userInfo[index].registerDate),
        ),
        Container(
          width: 200,
          height: 65,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(user.userInfo[index].terminationDate),
        ),
      ],
    );
  }
}

User user = User();

class User {
  List<UserInfo> userInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      userInfo.add(UserInfo(
          name: "User_$i",
          phone: '+001 9999 9999',
          registerDate: '2019-01-01',
          terminationDate: 'N/A',
          status: i % 3 == 0));
    }
  }

  ///
  /// Single sort, sort Name's id
  void sortName({required bool isAscending}) {
    userInfo.sort((a, b) {
      final int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
      final int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus({required bool isAscending}) {
    userInfo.sort((a, b) {
      if (a.status == b.status) {
        final int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
        final int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
        return aId - bId;
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class UserInfo {
  String name;
  bool status;
  String phone;
  String registerDate;
  String terminationDate;

  UserInfo(
      {this.name = "",
      this.phone = "",
      this.registerDate = "",
      this.terminationDate = "",
      required this.status});
}
