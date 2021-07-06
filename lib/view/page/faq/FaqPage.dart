import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/FaqModel.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  final faqF = SliderFunction.to;

  @override
  void initState() {
    faqF.getFaq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          appBar: AppBar(
            elevation: 2,
            brightness: Brightness.dark,
            title: Text(
                "سوالات متداول",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                )
            ),
            leading: IconButton(
                color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Get.back();
                }),
            centerTitle: true,
            backgroundColor: Theme
                .of(context)
                .primaryColorDark,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: faqF.faqLoading.value ?
            loading(color: Theme
                .of(context)
                .primaryColorDark,) :
            ListView.builder(
              itemCount: faqF.faqModel.post.length,
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  _itemFaq(faqF.faqModel.post[index]),
            ),
          ),
        ));
  }

  _itemFaq(FaqPost post) {
    return Card(
      margin: EdgeInsets.only(left: 15,right: 15 ,bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Text(post.question, style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            height: 1,
            color: Colors.grey[400],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, right: 15, left: 15),
            child: Text(post.answer, style: TextStyle(
              height:1.3,
                fontSize: 14, color: Colors.grey[600]
            ),),
          )
        ],
      ),
    );
  }
}
