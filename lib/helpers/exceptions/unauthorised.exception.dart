import '../../utils/logger.dart';

class UnauthorisedException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  UnauthorisedException({
    this.message = 'Unauthorized exceptions!',
    this.stackTrace,
  }) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
