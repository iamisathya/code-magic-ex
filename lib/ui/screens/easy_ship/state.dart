import 'package:code_magic_ex/models/order_lines.dart';

class EasyShipState {
  OrderLines orderLines;
  final bool hasError;
  final bool isLoading;

  EasyShipState({
    required this.orderLines,
    this.hasError = false,
    this.isLoading = false,
  });

  factory EasyShipState.initial() =>
      EasyShipState(orderLines: OrderLines(items: []));
  factory EasyShipState.loading() =>
      EasyShipState(orderLines: OrderLines(items: []), isLoading: true);
  factory EasyShipState.error() => EasyShipState(
        orderLines: OrderLines(items: []),
        hasError: true,
      );
}
