import '../utilities/Logger/logger.dart';

class UnauthorisedException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  UnauthorisedException({
    this.message = 'Internet error!',
    this.stackTrace,
  }) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
