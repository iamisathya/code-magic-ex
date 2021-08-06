import '../utilities/Logger/logger.dart';

class InvalidBodyException implements Exception {
  final String message;
  InvalidBodyException({required this.message}) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
