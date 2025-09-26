import 'package:logger/logger.dart';

class LoggingUtility {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  static void debug({
    required String message,
  }) {
    _logger.d(message);
  }

  static void info({
    required String message,
  }) {
    _logger.i(message);
  }

  static void warning({
    required String message,
  }) {
    _logger.w(message);
  }

  static void error({
    required String message,
    dynamic error,
  }) {
    _logger.e(
      message,
      error: error,
      stackTrace: StackTrace.current,
    );
  }
}


