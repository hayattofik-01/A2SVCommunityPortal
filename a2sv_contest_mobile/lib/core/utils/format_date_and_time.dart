import 'package:intl/intl.dart';

Map<String, String> formatDateAndTime(DateTime date) {
  final dateFormatter = DateFormat('MMMM d, y');
  final formattedDate = dateFormatter.format(date);
  final timeFormatter = DateFormat('HH:mm');
  final formattedTime = timeFormatter.format(date);
  return {'date': formattedDate, 'time': formattedTime};
}
