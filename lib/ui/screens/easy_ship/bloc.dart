import 'package:rxdart/rxdart.dart';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/ui/screens/easy_ship/state.dart';

class ContactBloc {
  final Stream<EasyShipState> state;

  final Subject<EasyShipState> _stateSubject;

  factory ContactBloc() {
    final subject = BehaviorSubject<EasyShipState>();
    return ContactBloc._(
        stateSubject: subject,
        state: subject.asBroadcastStream());
  }

  ContactBloc._({required this.state, required Subject<EasyShipState> stateSubject})
      : _stateSubject = stateSubject;

  Future<void> loadOrderlines({String userId = "108357166"}) async {
    _stateSubject.add(EasyShipState.loading());
    final String localUserId = userId;
    const String dateCreated = "[2020-11;2021-06]";
    const String criteria = "easyship";
    const String expand = "catalogSlide,order,order.customer";
    const String market = "TH";

    try {
      final OrderLines orderLines = await ApiService.shared().getOrderLines(localUserId, dateCreated, criteria, expand, market);
      _stateSubject.add(EasyShipState(orderLines: orderLines));
    } catch (err) {
      _stateSubject.add(EasyShipState.error());
      _stateSubject.addError(err);
    }
  }
}

final inventoryBLoc = ContactBloc();