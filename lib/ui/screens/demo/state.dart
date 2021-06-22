import 'package:code_magic_ex/ui/screens/demo/model.dart';

class ContactsPageState {
  List<Contacts> contacts;
  final bool hasError;
  final bool isLoading;

  ContactsPageState({
    required this.contacts,
    this.hasError = false,
    this.isLoading = false,
  });

  factory ContactsPageState.initial() =>
      ContactsPageState(contacts: <Contacts>[]);
  factory ContactsPageState.loading() =>
      ContactsPageState(contacts: [], isLoading: true);
  factory ContactsPageState.error() => ContactsPageState(
        contacts: [],
        hasError: true,
      );
}
