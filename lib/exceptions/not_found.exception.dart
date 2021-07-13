import 'package:code_magic_ex/utilities/Logger/logger.dart';

class NotFoundException implements Exception {
  final String message;
  NotFoundException({this.message = 'Not found!'}) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
