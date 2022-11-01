import 'package:easy_localization/easy_localization.dart';

class StringViewUtils {
  static String formatDateTime(DateTime dateTime) {
    final dateTimeLocal = dateTime.toLocal();
    final today = DateTime.now();

    if (dateTimeLocal.day == today.day &&
        dateTimeLocal.month == today.month &&
        dateTimeLocal.year == today.year) {
      return 'Hôm nay ${DateFormat('HH:mm', 'vi').format(dateTimeLocal)}';
    }

    final yesterday = today.subtract(Duration(hours: 24));
    if (dateTimeLocal.day == yesterday.day &&
        dateTimeLocal.month == yesterday.month &&
        dateTimeLocal.year == yesterday.year) {
      return 'Hôm qua ${DateFormat('HH:mm', 'vi').format(dateTimeLocal)}';
    }

    return DateFormat('HH:mm dd/MM/yyyy', 'vi').format(dateTime);
  }
}
