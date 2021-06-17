
import 'package:code_magic_ex/ui/screens/demo/model.dart';
import 'package:code_magic_ex/ui/screens/demo/state.dart';
import 'package:code_magic_ex/ui/screens/demo/service.dart';
import 'package:rxdart/rxdart.dart';

class ContactBloc {
  final Stream<ContactsPageState> state;
  final ContactService repository;
  final Subject<ContactsPageState> _stateSubject;

  factory ContactBloc(ContactService respository) {
    final subject = BehaviorSubject<ContactsPageState>();
    return ContactBloc._(
        repository: respository,
        stateSubject: subject,
        state: subject.asBroadcastStream());
  }

  ContactBloc._({required this.state, required Subject<ContactsPageState> stateSubject, required this.repository})
      : _stateSubject = stateSubject;

  Future<void> loadEvents() async {
    _stateSubject.add(ContactsPageState.loading());

    try {
      final List<Contacts> contacts = await ContactService.browse();
      _stateSubject.add(ContactsPageState(contacts: contacts));
    } catch (err) {
      _stateSubject.add(ContactsPageState.error());
      _stateSubject.addError(err);
    }
  }
}