import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  final SliderFunction aboutF = Get.put(SliderFunction());

  @override
  void initState() {
    aboutF.about();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: SingleChildScrollView(
        child: aboutF.aboutLoading.value?
        Padding(padding: EdgeInsets.only(top: 50),
            child:  loading(color: Theme.of(context).primaryColorDark)):
        Directionality(
            textDirection: TextDirection.rtl,
            child:  HtmlWidget(
              aboutF.aboutModel.data,
              // onTapUrl: (url) =>
              //     print('tapped $url'),
              textStyle: TextStyle(
                  color: Colors.black87,
                  // letterSpacing: 10,
                  // textBaseline: TextBaseline.alphabetic,
                  height: 2.5,
                  fontSize: 18),
            )
        ),
      ),
    ));
  }
}
