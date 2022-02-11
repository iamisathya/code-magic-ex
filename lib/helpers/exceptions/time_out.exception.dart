import '../../utils/logger.dart';

class TimeOutException implements Exception {
  final String message;
  TimeOutException({
    this.message = 'Timeout when trying to connect to the server',
  }) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
