import 'package:rxdart/rxdart.dart';

class TranslationBloc {
   final _appLanguageStreamController =
      BehaviorSubject<String>.seeded("en");

  Stream<String> get appLanguageStream =>
      _appLanguageStreamController.stream;

  Function(String) get setappLanguageStream => _appLanguageStreamController.sink.add;

  String get getCurrentLanguage => _appLanguageStreamController.value;
}
final translationBloc = TranslationBloc();
