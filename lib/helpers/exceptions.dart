import 'package:get/get.dart';

class AppException implements Exception {
  final String message;
  final int status;

  const AppException([this.message = "", this.status = 0]) : super();

  @override
  String toString() => message;

  void logError(Object err, StackTrace stack) {
    Get.printError(info: stack.toString());
    Get.printError(info: err.toString());
  }
}

/// Internet Connectivity
class InternetConnectivityException extends AppException {
  final String errMessage;
  final int errStatus;

  const InternetConnectivityException({
    this.errMessage =
        'There is no internet connection. Please connect to an active internet connection.',
    this.errStatus = 0,
  }) : super(errMessage, errStatus);
}

/// Api - TimedOut
class ApiTimedOutException extends AppException {
  final String errMessage;
  final int errStatus;

  const ApiTimedOutException({
    this.errMessage = 'Request is timed out. Please try again.',
    this.errStatus = 0,
  }) : super(errMessage, errStatus);
}

/// Api - TimedOut
class ApiResponseException extends AppException {
  final String errMessage;
  final int errStatus;

  const ApiResponseException({this.errMessage = '', this.errStatus = 0})
      : super(errMessage, errStatus);
}

/// General
class GeneralException extends AppException {
  final String errMessage;
  final int errStatus;

  const GeneralException({this.errMessage = '', this.errStatus = 0})
      : super(errMessage, errStatus);

  @override
  String toString() => (errMessage.isEmpty)
      ? 'Something went wrong. Please try again or contact administrator'
      : message;
}

/// Api - TimedOut
class UnexpectedException extends AppException {
  final String errMessage;
  final int errStatus;

  const UnexpectedException({
    this.errMessage = 'Something went wrong. Please try again.',
    this.errStatus = 0,
  }) : super(errMessage, errStatus);
}
