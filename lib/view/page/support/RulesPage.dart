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
  final roulef = SliderFunction.to;

  @override
  void initState() {
    roulef.rules();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child:roulef.rulesLoading.value? loading(color: Theme.of(context).primaryColorDark) :SingleChildScrollView(
        child:Directionality(
            textDirection: TextDirection.rtl,
            child:  HtmlWidget(
              roulef.rulesModel.data,
              // onTapUrl: (url) =>
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
