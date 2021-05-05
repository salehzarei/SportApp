import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

class RulesPage extends StatefulWidget {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  final SliderFunction roulef = Get.put(SliderFunction());

  @override
  void initState() {
    roulef.rules();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: SingleChildScrollView(
        child: roulef.rulesLoading.value?
        Padding(padding: EdgeInsets.only(top: 50),
            child:  loading(color: Theme.of(context).primaryColorDark)):
        Directionality(
            textDirection: TextDirection.rtl,
            child:  HtmlWidget(
              roulef.rulesModel.data,
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
