import 'package:intl/intl.dart';

String formatCurrency(String value) {
  final format = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  final number = int.parse(value);
  return format.format(number);
}

String formatNumber(double number) {
  if (number == number.toInt() && number % 1 == 0 && number < 1000) {
    return number.toInt().toString();
  } else if (number >= 1000) {
    double formattedNumber = number / 1000;
    String formattedString = formattedNumber.toStringAsFixed(1);

    if (formattedString.endsWith('.0')) {
      formattedString =
          formattedString.substring(0, formattedString.length - 2);
    }
    return "${formattedString}K";
  } else {
    return number.toString();
  }
}
