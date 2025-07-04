import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;

  final Logger _logger;

  AppLogger._internal() : _logger = Logger();

  void info(String message) => _logger.i(message);
  void warn(String message) => _logger.w(message);
  void error(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}
