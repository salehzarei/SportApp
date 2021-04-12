
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

maskedText(String price) {
  return MoneyMaskedTextController(
      precision: 0,
      thousandSeparator: ',',
      decimalSeparator: '',
      initialValue: double.parse(price))
      .text;
}

Future saveShared(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getShared(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final _loadShared = prefs.getString(key);
  return _loadShared;
}