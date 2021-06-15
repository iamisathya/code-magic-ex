import 'dart:async';

import 'package:code_magic_ex/api/config/api_service.dart';
import 'package:rxdart/rxdart.dart';

import 'search_state.dart';

class SearchBloc {
  final Sink<bool> onViewLaunch;
  final Stream<SearchState> state;

  factory SearchBloc() {
    
    final onViewLaunch = PublishSubject<bool>();

    final state = onViewLaunch
        // If the text has not changed, do not perform a new search
        .distinct()
        // Wait for the user to stop typing for 250ms before running a search
        .debounceTime(const Duration(milliseconds: 250))
        // Call the Github api with the given search term and convert it to a
        // State. If another search term is entered, flatMapLatest will ensure
        // the previous search is discarded so we don't deliver stale results
        // to the View.
        .switchMap<SearchState>((bool term) => _fetchInvenotryData())
        // The initial state to deliver to the screen.
        .startWith(SearchNoTerm());

    return SearchBloc._(onViewLaunch, state);
  }

  SearchBloc._(this.onViewLaunch, this.state);

  void dispose() {
    onViewLaunch.close();
  }

  static Stream<SearchState> _fetchInvenotryData() => Rx.fromCallable(() => ApiService.shared()
        .getInventoryRecords(
            "9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c",
            "item"))
          .map((result) =>
              result.items.isEmpty ? SearchEmpty() : SearchPopulated(result))
          .startWith(SearchLoading())
          .onErrorReturn(SearchError());
}
