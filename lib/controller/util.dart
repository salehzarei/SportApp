import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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

listSnackBar({@required list, @required bool err}) {
  return Get.snackbar(
    '',
    '',
    titleText: Text(''),
    messageText: Container(
      child: ListView.builder(
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: HtmlWidget(
                list[index],
                textStyle:
                    TextStyle(color: Colors.white, height: 1.2, fontSize: 14),
              ),
            );
          }),
    ),
    backgroundColor: err ? Colors.red : Colors.green,
    colorText: Colors.white,
    icon: Icon(
      err ? Icons.error : Icons.check,
      color: Colors.white,
      size: 40,
    ),
  );
}
