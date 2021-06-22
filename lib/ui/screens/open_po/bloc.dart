import 'package:code_magic_ex/models/open_po.dart';
import 'package:rxdart/rxdart.dart';

import 'package:code_magic_ex/ui/screens/open_po/state.dart';
import 'package:code_magic_ex/api/config/api_service.dart';

class OpenPoBloc {
  final Stream<OpenPoState> state;

  final Subject<OpenPoState> _stateSubject;

  factory OpenPoBloc() {
    final subject = BehaviorSubject<OpenPoState>();
    return OpenPoBloc._(
        stateSubject: subject, state: subject.asBroadcastStream());
  }

  OpenPoBloc._(
      {required this.state, required Subject<OpenPoState> stateSubject})
      : _stateSubject = stateSubject;

  Future<void> getAllOpenPo() async {
    _stateSubject.add(OpenPoState.loading());
    try {
      final List<OpenPO> openPoList = await MemberCallsService.init().getAllOpenPo("106", "12", "2970466");
      _stateSubject.add(OpenPoState(openPO: openPoList));
    } catch (err) {
      _stateSubject.add(OpenPoState.error());
      _stateSubject.addError(err);
    }
  }
}

final openPoBloc = OpenPoBloc();
