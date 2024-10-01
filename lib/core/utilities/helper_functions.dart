import 'package:intl/intl.dart';

abstract class HelperFunctions{
  static String formatDateTime(DateTime now){
    String formatDate = DateFormat('dd/MM/yyyy').format(now);
    return formatDate;
  }
  static String formatTime(DateTime now){
    String formatDate = DateFormat.jm().format(now);
    return formatDate;
  }
}