// import 'package:code_magic_ex/models/inventory_records.dart';
// import 'package:rxdart/rxdart.dart';

// // class InventoryState {
// //   final InventoryRecords inventoryRecords;
// //   final bool hasError;
// //   final bool isLoading;

// //   InventoryState({
// //     required this.inventoryRecords,
// //     required this.hasError,
// //     required this.isLoading,
// //   });

// //   factory InventoryState.initial() => InventoryState(
// //       inventoryRecords: InventoryRecords(items: []),
// //       hasError: false,
// //       isLoading: false);
// //   factory InventoryState.loading() => InventoryState(
// //       inventoryRecords: InventoryRecords(items: []),
// //       hasError: false,
// //       isLoading: true);
// //   factory InventoryState.error() => InventoryState(
// //       inventoryRecords: InventoryRecords(items: []),
// //       hasError: true,
// //       isLoading: false);
// // }

// class InventoryState {
//   InventoryRecords inventoryRecords;
//   final bool hasError;
//   final bool isLoading;

//   InventoryState({
//     this.inventoryRecords,
//     this.hasError = false,
//     this.isLoading = false,
//   });

//   factory InventoryState.initial() => InventoryState(
//       inventoryRecords: InventoryRecords(items: []));
//   factory InventoryState.loading() => InventoryState(
//       isLoading: true);
//   factory InventoryState.error() => InventoryState(
//       hasError: true,);
// }

// class HomeBloc {
//   final Stream<InventoryState> state;
//   final EventRepository repository;
//   final Subject<InventoryState> _stateSubject;

//   factory HomeBloc(EventRepository respository) {
//     final subject = BehaviorSubject();
//     return HomeBloc._(
//         repository: respository,
//         stateSubject: subject,
//         state: subject.asBroadcastStream());
//   }

//   HomeBloc._({this.state, Subject<InventoryState> stateSubject, this.repository})
//       : _stateSubject = stateSubject;

//   Future<void> loadEvents() async {
//     _stateSubject.add(InventoryState.loading());

//     try {
//       final InventoryRecords inventoryRecords = await repository.getEventList(1);
//       _stateSubject.add(InventoryState(inventoryRecords: inventoryRecords));
//     } catch (err) {
//       _stateSubject.addError(err);
//     }
//   }
// }

// // class HomeState {

// //       List<String> result;
// //       final bool hasError;
// //       final bool isLoading;

// //        HomeState({
// //         this.result = const [],
// //         this.hasError = false,
// //         this.isLoading = false,
// //       });

// //       factory HomeState.initial() =>
// //           HomeState(result: <String>[]);
// //       factory HomeState.loading() => HomeState(isLoading: true);
// //       factory HomeState.error() => HomeState(hasError: true);

// //     }
