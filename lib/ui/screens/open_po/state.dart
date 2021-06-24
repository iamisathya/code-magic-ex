import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';

class OpenPoState {
  List<OpenPO> openPO;
  List<OpenPlaceOrderDetails> openPlaceOrderDetails;
  final bool hasError;
  final bool isLoading;

  OpenPoState({
    required this.openPO,
    this.hasError = false,
    this.isLoading = false,
    this.openPlaceOrderDetails = const <OpenPlaceOrderDetails>[],
  });

  factory OpenPoState.initial() => OpenPoState(openPO: []);
  factory OpenPoState.loading() => OpenPoState(openPO: [], isLoading: true);
  factory OpenPoState.error() => OpenPoState(
        openPO: [],
        hasError: true,
      );
}
