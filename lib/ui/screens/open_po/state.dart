import 'package:code_magic_ex/models/open_po.dart';

class OpenPoState {
  List<OpenPO> openPO;
  final bool hasError;
  final bool isLoading;

  OpenPoState({
    required this.openPO,
    this.hasError = false,
    this.isLoading = false,
  });

  factory OpenPoState.initial() => OpenPoState(openPO: []);
  factory OpenPoState.loading() => OpenPoState(openPO: [], isLoading: true);
  factory OpenPoState.error() => OpenPoState(
        openPO: [],
        hasError: true,
      );
}
