import 'dart:convert';

import 'package:code_magic_ex/models/open_po.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'package:code_magic_ex/ui/screens/open_po/state.dart';
import 'package:code_magic_ex/api/config/api_service.dart';

import 'components/OPenPoOne.dart';

class OpenPoBloc {
  final Stream<OpenPoState> state;

  final Subject<OpenPoState> _stateSubject;

  factory OpenPoBloc() {
    final subject = BehaviorSubject<OpenPoState>();
    return OpenPoBloc._(
        stateSubject: subject, state: subject.asBroadcastStream());
  }

  OpenPoBloc._(
      {required this.state, required Subject<OpenPoState> stateSubject})
      : _stateSubject = stateSubject;

  Future<void> getAllOpenPo() async {
    _stateSubject.add(OpenPoState.loading());
    try {
      List<OpenPO> myModels;
      final response = await Dio().get("https://member-calls.unicity.com/ALL/DSC/getdata.php?type=106&mode=12&dscid=2970466");
      final list = json.decode(response.data as String) as List;
      myModels = list.map((i) =>
              OpenPO.fromJson(i as Map<String, dynamic>)).toList();
              //*  Adding this to show header in the table
              myModels.insert(0, OpenPO(orderDscid: "DSC ID", iconAttachment: "Attachment", orderDate: "Date", orderOpid: "P/O Number", orderStatus: "Status", orderTime: "Time", orderTotalPrice: "Totol Price", orderTotalPv: "Total PV" ));
      
      // final OpenPoOne openPoList1 = await MemberCallsService.init().getAllOpenPoOne("106", "12", "2970466");
      // final List<OpenPO> openPoList = await MemberCallsService.init().getAllOpenPo("106", "12", "2970466");
      _stateSubject.add(OpenPoState(openPO: myModels));
    } catch (err) {
      _stateSubject.add(OpenPoState.error());
      _stateSubject.addError(err);
    }
  }
}

final openPoBloc = OpenPoBloc();
