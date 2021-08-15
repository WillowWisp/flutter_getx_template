import 'package:logger/logger.dart';

class LogUtils {
  static final _logger = Logger();
  static final _loggerNoST = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  /// return `null` => Logger will print current stack trace
  static StackTrace? _normalizeStackTrace(StackTrace? stackTrace) {
    final bool logCurrentTraceInstead =
        stackTrace == null || stackTrace.toString() == '';

    return logCurrentTraceInstead ? null : stackTrace;
  }

  static void e(String message, [dynamic exception, StackTrace? stackTrace]) {
    _logger.e(message, exception, _normalizeStackTrace(stackTrace));
  }

  static void d(String message, [dynamic exception, StackTrace? stackTrace]) {
    _logger.d(message, exception, _normalizeStackTrace(stackTrace));
  }

  static void dNoST(String message, [dynamic exception]) {
    _loggerNoST.d(message, exception);
  }

  static void iNoST(String message, [dynamic exception]) {
    _loggerNoST.i(message, exception);
  }
}
