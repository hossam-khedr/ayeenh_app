import 'package:intl/intl.dart';

abstract class HelperFunctions{
  static  formatDateTime(DateTime now){
    var formatDate = DateFormat('dd/MM/yyyy').format(now);
    return formatDate;
  }
}