import 'package:code_magic_ex/models/order_list_rmas.dart';

class SalesReportPageState {
  OrdersAndRmas ordersAndRMAs;
  final bool hasError;
  final bool isLoading;

  SalesReportPageState({
    required this.ordersAndRMAs,
    this.hasError = false,
    this.isLoading = false,
  });

  factory SalesReportPageState.initial() =>
      SalesReportPageState(ordersAndRMAs: OrdersAndRmas(orders: [], rmas: []));
  factory SalesReportPageState.loading() => SalesReportPageState(
      ordersAndRMAs: OrdersAndRmas(orders: [], rmas: []), isLoading: true);
  factory SalesReportPageState.error() => SalesReportPageState(
        ordersAndRMAs: OrdersAndRmas(orders: [], rmas: []),
        hasError: true,
      );
}
