import 'package:intl/intl.dart';

String formatInt(int input) {
  var f = NumberFormat("###,###");
  return f.format(input);
}

String formatCurrency(int input) {
  return formatInt(input) + "đ";
}