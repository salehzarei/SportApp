import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/favorite/FavoriteConstant.dart';
import 'package:sportapplication/view/page/following/followConstant.dart';

class ViewAllPage extends StatefulWidget {
  int from;

  ViewAllPage(this.from);

  @override
  _ViewAllPageState createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  final subSetFunction = SubSetFunction.to;
  final articleFunction = ArticleFunction.to;
  final packageFunction = PackageFunction.to;
  final registerFunction = RegisterFunction.to;
  String _title = ' ';
  String _token = ' ';

  @override
  void initState() {
    getShared('token').then((token) {
      _token = token;
      switch (widget.from) {
        case 1:
          if (mounted) {
            setState(() {
              _title = 'پکیج های پیشنهادی';
            });
          }
          packageFunction.geUserPackageList(
              token: token,
              favorite: '',
              word: '',
              uid: '',
              interest: '',
              folowing: '',
              catId: '',
              asc: '',
              special: '1',
              order: '',
              sort: '',
              limit: '',
              page: '',
              level: '');
          break;
        case 2:
          if (mounted) {
            setState(() {
              _title = 'پکیج های مرتبط';
            });
          }
          packageFunction.geUserPackageList(
              token: token,
              favorite: '',
              word: '',
              uid: '',
              interest: '1',
              folowing: '',
              catId: '',
              asc: '',
              special: '',
              order: '',
              sort: '',
              limit: '',
              page: '',
              level: '');
          break;

        case 3:
          if (mounted) {
            setState(() {
              _title = 'جدید ترین مقالات';
            });
          }
          articleFunction.blogList(
              token: token,
              folowing: '',
              interest: '',
              uid: '',
              page: '',
              order: '',
              catId: '',
              favorite: '',
              word: '',
              tag: '',
              limit: '',
              sort: '',
              asc: '');
          break;

        case 4:
          if (mounted) {
            setState(() {
              _title = 'مقالات مرتبط';
            });
          }
          articleFunction.blogList(
              token: token,
              folowing: '',
              interest: '1',
              uid: '',
              page: '',
              order: '',
              catId: '',
              favorite: '',
              word: '',
              tag: '',
              limit: '',
              sort: '',
              asc: '');
          break;
        case 5:
          if (mounted) {
            setState(() {
              _title = 'پیشنهادات اسپورت پلاس';
            });
          }
          registerFunction.providers(
            token: token,
            following: '',
            activity_scope: '',
            special: '1',
            level: '',
          );
          break;
        case 6:
          if (mounted) {
            setState(() {
              _title = 'دنبال شونده ها';
            });
          }
          registerFunction.providers(
            token: token,
            following: '1',
            activity_scope: '',
            special: '',
            level: '',
          );
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          elevation: 2,
          brightness: Brightness.dark,
          title:
              Text(_title, style: TextStyle(fontSize: 18, color: Colors.white)),
          leading: IconButton(
              color: Colors.white,
              iconSize: 20,
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: _listView()));
  }

  _listView() {
    switch (widget.from) {
      case 1:
      case 2:
        return Directionality(
            textDirection: TextDirection.rtl,
            child: packageFunction.userPackageLoading.value
                ? loading(color: Theme.of(context).primaryColorDark)
                :
            packageFunction.userPackageModel.post.isNotEmpty? ListView.builder(
                    itemCount: packageFunction.userPackageModel.post.length,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => itemPackageFav(
                        index: index,
                        context: context,
                        data: packageFunction.userPackageModel.post[index],
                        onTap: () {},
                        fav: false),
                  ):noItem()
        );
        break;
      case 3:
      case 4:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: articleFunction.blogLoading.value
              ? loading(color: Theme.of(context).primaryColorDark)
              :
          articleFunction.blogModel.post.isNotEmpty ?ListView.builder(
                  itemCount: articleFunction.blogModel.post.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) => itemArticleFav(
                      index: index,
                      context: context,
                      data: articleFunction.blogModel.post[index],
                      onTap: () {},
                      fav: false),
                ):noItem(),
        );
        break;
      case 5:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: registerFunction.providerLoading.value?loading(color: Theme.of(context).primaryColorDark): registerFunction.providerList.post.isEmpty?noItem():
          ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: registerFunction.providerList.post.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => followListItem(context: context,follow:false, data:registerFunction.providerList.post[index], removeProvider: (){}),),
        );
        return;
      case 6:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: registerFunction.providerLoading.value?loading(color: Theme.of(context).primaryColorDark): registerFunction.providerList.post.isEmpty?noItem():
          ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: registerFunction.providerList.post.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => followListItem(context: context, data:registerFunction.providerList.post[index],follow:true, removeProvider: (){
              registerFunction.unFollow(_token, registerFunction.providerList.post[index].following.toString()).whenComplete((){
                listSnackBar(list: registerFunction.errorMassages, err: registerFunction.checkerror.value);
                if(!registerFunction.checkerror.value){
                  registerFunction.providerLoading.value = true;
                  registerFunction.providers( token: _token, following: '1', level: '', activity_scope: '', special: '',);
                }
              });
            }),),
        );
        break;
    }
  }
}
