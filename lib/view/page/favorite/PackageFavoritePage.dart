import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/favorite/FavoriteConstant.dart';

class PackageFavoritePage extends StatefulWidget {
  @override
  _PackageFavoritePageState createState() => _PackageFavoritePageState();
}

class _PackageFavoritePageState extends State<PackageFavoritePage> {
  final PackageFunction packageFunction = Get.put(PackageFunction());
  String _token;
  @override
  void initState() {
    getShared("token").then((token) {
      _token = token;
      fetchItem(token);
    });

    super.initState();
  }
  fetchItem(String token){
    packageFunction
        .geUserPackageList(
        token: token,
        favorite: '1',
        word: '',
        uid: '',
        interest: '',
        folowing: '',
        catId: '',
        asc: '',
        special: '',
        order: '',
        sort: '',
        limit: '',
        page: '');
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: !packageFunction.userPackageLoading.value
            ? ListView.builder(
                itemCount: packageFunction.userPackageModel.post.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10),
                itemBuilder: (context, index) => itemPackageFav(
                    index: index,
                    context: context,
                    data: packageFunction.userPackageModel.post[index], onTap: (){
                  packageFunction.removeFav(token: _token, proId: packageFunction.showPackageModel.data.favorit.toString()).then((value) {
                    if(value == 200){
                      fetchItem(_token);
                      listSnackBar(list:packageFunction.errorMassages , err:false );
                    }else{
                      listSnackBar(list:packageFunction.errorMassages , err:true );
                    }
                  });
                }),
              )
            : loading(color: Theme.of(context).primaryColorDark),
      ),
    );
  }
}
