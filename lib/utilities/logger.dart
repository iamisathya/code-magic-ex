import 'package:logger/logger.dart';

class LoggerService {
  // ignore: unused_field
  Logger _logger = Logger(printer: PrettyPrinter(lineLength: 50, errorMethodCount: 5));

  static final LoggerService _instance = LoggerService._internal();

  static Logger instance = Logger();

  factory LoggerService() {
    return _instance;
  }

  LoggerService._internal() {
    // add initialization logic if needed example: Logger(printer: PrettyPrinter(methodCount: 0));
    _logger = Logger(printer: PrettyPrinter());
  }
}
