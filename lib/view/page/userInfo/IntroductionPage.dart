import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/showProviderModel.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class IntroductionPage extends StatefulWidget {

  String title;
  String description;
  String id;
  int level;
  int me;
  List<ActivityScope> activity_scope;

  IntroductionPage(this.title,this.description,this.level,this.id,this.me,this.activity_scope);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  final SubSetFunction subSetFunction = Get.put(SubSetFunction());
  bool _desOpen = true;
  bool _desScope = true;
  bool subsetLoading = false;
  String ll;
  String _token;

  @override
  void initState() {
    getShared("token").then((tok){
      _token =tok;
    });
    switch(widget.level){
      case 2:
        if(mounted){
          setState(() {
            ll = 'باشگاه';
          });
        }
        break;
      case 3:
        if(mounted){
          setState(() {
            ll = 'مربی';
          });
        }
        break;
      case 4:
        if(mounted){
          setState(() {
            ll = 'دکتر';
          });
        }
        break;
      case 5:
        if(mounted){
          setState(() {
            ll = 'فروشگاه';
          });
        }
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark,
        title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white
            )
        ),
        leading:IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Get.back();
            }) ,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15 , right: 15 , top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text("توضیحات" , style: TextStyle(
                            fontSize: 14 , color: Colors.black , fontWeight: FontWeight.bold
                          ),),
                           InkWell(
                               onTap: () {
                                 if(mounted){
                                   setState(() {
                                     _desOpen = !_desOpen;
                                   });
                                 }
                               },
                               borderRadius: BorderRadius.circular(10),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(_desOpen?Icons.keyboard_arrow_down_sharp :Icons.keyboard_arrow_up_sharp, color: Colors.black ,size: 18,),
                           )),
                        ],
                      ),
                    ),
                    _desOpen? Container(
                      margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
                      height: 1,
                      color: Colors.grey[400],
                    ):SizedBox(height: 20,),
                    _desOpen? Text(widget.description , style: TextStyle(
                      fontSize: 14 , color: Colors.grey[600]
                    ),):SizedBox()
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text("سطح کاربری" , style: TextStyle(
                            fontSize: 14 , color: Colors.black , fontWeight: FontWeight.bold
                          ),),
                          Text(ll , style: TextStyle(
                              fontSize: 14 , color: Colors.black , fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15 , right: 15 , top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("حوزه فعالیت",  style: TextStyle(
                            fontSize: 14 , color: Colors.black , fontWeight: FontWeight.bold
                        ),),
                        InkWell(
                            onTap: () {
                              if(mounted){
                                setState(() {
                                  _desScope = !_desScope;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(_desScope?Icons.keyboard_arrow_down_sharp :Icons.keyboard_arrow_up_sharp, color: Colors.black ,size: 18,),
                            )),
                      ],
                    ),
                  ),
                  _desScope?  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
                    scrollDirection: Axis.vertical,
                    itemCount: widget.activity_scope.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => itemHoze(context: context, index: index,data:widget.activity_scope[index]),
                  ):SizedBox(height: 20,),
                  if(_desScope)
                     Text(widget.description , style: TextStyle(
                      fontSize: 14 , color: Colors.grey[600]
                  ),)
                ],
              ),
            ),
               if(widget.me == 0)
                   Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  if(mounted){
                    setState(() {
                      subsetLoading = true;
                    });
                  }
                  subSetFunction.addSubset(_token,widget.id).then((value) {
                    if(mounted){
                      setState(() {
                        subsetLoading = false;
                      });
                    }
                    if(value == 200){
                      listSnackBar(list: subSetFunction.errorMassages, err: false);
                    }else{
                      listSnackBar(list: subSetFunction.errorMassages, err: true);
                    }
                  });
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            side: BorderSide(color: Colors.red)
                        )
                    ),
                    backgroundColor:MaterialStateProperty.all<Color>(Colors.white)),
                child: subsetLoading? loading(color: Colors.red):Text(
                  "ثبت درخواست عضویت",
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
