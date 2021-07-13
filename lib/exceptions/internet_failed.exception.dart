import 'package:code_magic_ex/utilities/Logger/logger.dart';

class InternetFailedException implements Exception {
  final String message;

  InternetFailedException({
    this.message = 'Failed to connect to server!',
  }) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}