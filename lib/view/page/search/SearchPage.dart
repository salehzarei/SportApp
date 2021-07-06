import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/map/MapConstant.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final active = Controller.to;
  final packageFunction = PackageFunction.to;
  FocusNode _searchFocus = FocusNode();
  TextEditingController _searchController = TextEditingController();
  String _token;
  @override
  void initState() {
    getShared('token').then((value) {
      _token = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_rounded, size: 20, color: Colors.grey[600]),),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child:textFormFieldSearchHintWidget(
                            context: context,
                            focus: _searchFocus,
                            controller: _searchController,
                            hint: "متن جستجو",
                            maxLine: 1,
                            keyboardType: TextInputType.text,
                            maxLength: 1000, onPressed: (){
                              if(_searchController.text.isNotEmpty){
                                packageFunction.geUserPackageList(token: _token,
                                    catId: "",
                                    word:_searchController.text.trim(),
                                    uid: '',
                                    sort: "",
                                    order: "",
                                    limit: "",
                                    interest: "",
                                    page: "",
                                    special: "",
                                    folowing: "",
                                    level: '',
                                    asc: "",
                                    favorite: '');
                              }
                            }
                        )
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child:packageFunction.userPackageLoading.value?SizedBox():Directionality(
                  textDirection: TextDirection.rtl,
                  child:packageFunction.userPackageModel.post.isEmpty? noItem() : ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemCount:  packageFunction.userPackageModel.post.length,
                    itemBuilder:(context, index) => itemPackageList(context: context, index: index,data:packageFunction.userPackageModel.post[index]),),
                ))
          ],
        ),
      ),
    ));
  }
}
