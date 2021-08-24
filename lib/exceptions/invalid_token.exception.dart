import '../utilities/logger.dart';

class InvalidTokenException implements Exception {
  final String message;
  InvalidTokenException({this.message = 'Invalid token!'}) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
