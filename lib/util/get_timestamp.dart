import 'package:intl/intl.dart';

getTimeFromTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('h:mm a');
  return formatter.format(date);
}

getDateFromTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('E');
  return formatter.format(date);
}
