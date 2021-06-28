import 'package:logger/logger.dart';

class DefaultException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  DefaultException({
    this.message = 'Internnet error!',
    this.stackTrace,
  }) {
    Logger().e(stackTrace);
  }

  @override
  String toString() => message;
}
