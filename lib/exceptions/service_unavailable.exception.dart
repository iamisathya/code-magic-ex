import '../utilities/Logger/logger.dart';

class ServiceUnavailableException implements Exception {
  final String message;
  ServiceUnavailableException({this.message = 'Service Unavailable!'}) {
    LoggerService.instance.e(message);
  }

  @override
  String toString() => message;
}
