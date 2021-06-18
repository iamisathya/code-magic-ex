
import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:code_magic_ex/ui/screens/demo/model.dart';

class SalesReportPageState {
  OrdersAndRmas ordersAndRMAs;
  final bool hasError;
  final bool isLoading;

  SalesReportPageState({
    required this.ordersAndRMAs,
    this.hasError = false,
    this.isLoading = false,
  });

  factory SalesReportPageState.initial() => SalesReportPageState(
      ordersAndRMAs: OrdersAndRmas(items: []));
  factory SalesReportPageState.loading() => SalesReportPageState(
      ordersAndRMAs: OrdersAndRmas(items: []),
      isLoading: true);
  factory SalesReportPageState.error() => SalesReportPageState(
      ordersAndRMAs: OrdersAndRmas(items: []),
      hasError: true,);
}
