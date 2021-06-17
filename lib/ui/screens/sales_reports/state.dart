
import 'package:code_magic_ex/ui/screens/demo/model.dart';

class SalesReportPageState {
  List<Contacts> contacts;
  final bool hasError;
  final bool isLoading;

  SalesReportPageState({
    required this.contacts,
    this.hasError = false,
    this.isLoading = false,
  });

  factory SalesReportPageState.initial() => SalesReportPageState(
      contacts: <Contacts>[]);
  factory SalesReportPageState.loading() => SalesReportPageState(
      contacts: [],
      isLoading: true);
  factory SalesReportPageState.error() => SalesReportPageState(
      contacts: [],
      hasError: true,);
}
