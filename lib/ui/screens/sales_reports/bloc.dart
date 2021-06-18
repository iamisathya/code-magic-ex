import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:rxdart/rxdart.dart';

import 'package:code_magic_ex/ui/screens/demo/model.dart';
import 'package:code_magic_ex/ui/screens/demo/service.dart';
import 'package:code_magic_ex/ui/screens/sales_reports/state.dart';

class SalesReportBloc {
  final Stream<SalesReportPageState> state;
  final Subject<SalesReportPageState> _stateSubject;

  factory SalesReportBloc() {
    final subject = BehaviorSubject<SalesReportPageState>();
    return SalesReportBloc._(
        stateSubject: subject,
        state: subject.asBroadcastStream());
  }

  SalesReportBloc._({required this.state, required Subject<SalesReportPageState> stateSubject})
      : _stateSubject = stateSubject;

  Future<void> loadSalesReports() async {
    _stateSubject.add(SalesReportPageState.loading());

    try {
      final OrdersAndRmas ordersAndRMAs = await ApiService.shared().getOrdersAndRmas("9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c", "[2021-05-01;2021-06-01]", "expand=order,rma");
      final List<String> validOrders = await MemberCalls2Service.init().getValidOrders("barcode", "2021-05-01", "2021-06-01", "85905f08-b320-4e20-a6d1-2d96ebec6481", "en", "2970466", "1");
      _stateSubject.add(SalesReportPageState(ordersAndRMAs: ordersAndRMAs));
    } catch (err) {
      _stateSubject.add(SalesReportPageState.error());
      _stateSubject.addError(err);
    }
  }
}

final salesReportBloc = SalesReportBloc();