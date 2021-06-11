import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

enum Languages {
  en,
  th,
}

class TranslationBloc {
   final _appLanguageStreamController =
      BehaviorSubject<Languages>.seeded(Languages.en);

  Stream<Languages> get appLanguageStream =>
      _appLanguageStreamController.stream;

  Function(Languages) get setappLanguageStream => _appLanguageStreamController.sink.add;

  Languages get getLanguageMode => describeEnum(_appLanguageStreamController.value) == "en" ? Languages.en : Languages.th;
}
final translationBloc = TranslationBloc();
