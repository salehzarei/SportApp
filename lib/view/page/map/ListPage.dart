import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/map/MapConstant.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  int indexItem = 0;
  List<String> accountList = [ 'باشگاه', 'مربی', 'دکتر', 'فروشگاه'];
  String _token;

  final packageFunction = PackageFunction.to;

  @override
  void initState() {
    getShared("token").then((token) {
      _token = token;
      getPackage('2');

    });

    super.initState();
  }

  void getPackage(String level) {
    packageFunction.geUserPackageList(token: _token,
        catId: "",
        word: "",
        uid: '',
        sort: "",
        order: "",
        limit: "",
        interest: "",
        page: "",
        special: "",
        folowing: "",
        level: level,
        asc: "",
        favorite: '');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: 45,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 3),
              margin: EdgeInsets.symmetric(vertical: 6),
              child: ListView.builder(
                padding: EdgeInsets.only(right: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: accountList.length,
                itemBuilder:(context, index) => categoryItemList1(title:accountList[index],onTab:(){
                  if(mounted){
                    setState(() {
                      switch(index){
                        case 0:
                          getPackage('2');
                          break;
                        case 1:
                          getPackage('3');
                          break;
                        case 2:
                          getPackage('4');
                          break;
                        case 3:
                          getPackage('5');
                          break;
                      }
                      indexItem = index;
                    }
                    );
                  }
                }, index: index , indexItem:indexItem, context: context),
              ),
            ),
            Expanded(
                child: packageFunction.userPackageLoading.value?
                loading(color: Theme.of(context).primaryColorDark):
                packageFunction.userPackageModel.post.isEmpty?
                noItem():
                ListView.builder(
                  itemCount: packageFunction.userPackageModel.post.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(bottom: 60),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => itemPackageList(context: context, index: index,data:packageFunction.userPackageModel.post[index]),))
          ],
        ),
      ),
    ));
  }
}

