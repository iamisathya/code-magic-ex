// import 'package:rxdart/rxdart.dart';

// import 'package:code_magic_ex/ui/screens/demo/model.dart';
// import 'package:code_magic_ex/ui/screens/demo/service.dart';

// class ContactManager {
//   final PublishSubject<String> _searchText = PublishSubject<String>();
//   final BehaviorSubject<int> _totalCount = BehaviorSubject<int>.seeded(0);
//   final BehaviorSubject<bool> _loading = BehaviorSubject<bool>.seeded(false);
//   final PublishSubject<List<Contacts>> _allContacts = PublishSubject();

//   Sink<String> get getSeachedText => _searchText.sink;
//   Function(String) get setSearchTextStream => _searchText.sink.add;

//   Sink<bool> get loading => _loading.sink;

//   Stream<int> get totalContacts => _totalCount.stream;

//   Stream<List<Contacts>> get allContacts => _allContacts.stream;

//   int getTotalContacts() {
//     return _totalCount.stream.value;
//   }

//   bool isLoading() {
//     return _loading.value;
//   }

//   Future<List<Contacts>> getAlllContacts() {
//     return _allContacts.stream.first;
//   }

//   Future<void> fetchAlllContacts() async {
//     loading.add(true);
//     final List<Contacts> contacts = await ContactService.browse();
//     _allContacts.add(contacts);
//     _totalCount.add(contacts.length);
//     loading.add(false);
//   }

//   ContactManager() {
//     _searchText.stream.listen((searchKey) async {
//       final List<Contacts> contacts = await ContactService.browse();
//       _allContacts.add(contacts);
//       _totalCount.add(contacts.length);
//     });
//   }

//   void dispose() {
//     _searchText.close();
//     _totalCount.close();
//     _allContacts.close();
//   }
// }

// final contactBLoc = ContactManager();

