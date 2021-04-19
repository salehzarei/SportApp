
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

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

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'امکان باز کردن این سایت وجود ندارد:  $url';
  }
}


lottieLoading() {
  return Container(
    height: 90,
    child: Center(
      child: Lottie.asset(
        'assets/json/loading_cart.json',
        width: 50,
        height: 20,
      ),
    ),
  );
}