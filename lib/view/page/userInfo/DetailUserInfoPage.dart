
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/component/TabViewHeader.dart';
import 'package:sportapplication/view/page/userInfo/ArticleTab.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';
import 'package:sportapplication/view/page/userInfo/GalleryTab.dart';
import 'package:sportapplication/view/page/userInfo/IntroductionPage.dart';
import 'package:sportapplication/view/page/userInfo/SubsetTab.dart';
import 'package:sportapplication/view/page/userInfo/UserPackageTab.dart';

class DetailUserInfoPage extends StatefulWidget {

  String uId;

  DetailUserInfoPage(this.uId);

  @override
  _DetailUserInfoPageState createState() => _DetailUserInfoPageState();
}

class _DetailUserInfoPageState extends State<DetailUserInfoPage>
    with SingleTickerProviderStateMixin {

  final registerFunction = RegisterFunction.to;
  final subSetFunction = SubSetFunction.to;

  TabController _tabController;

  bool followLoading = false;
  bool subsetLoading = false;

  int _select = 0;
  String _token;

  @override
  void initState() {
    super.initState();
    getShared("token").then((token) {
      _token = token;
      registerFunction.showProviderLoading.value= true;
      registerFunction.showProvider(token: token, bId: widget.uId).whenComplete(() {
        _tabController = TabController(vsync: this, length: registerFunction.showProviderModel.info.level == 3 || registerFunction.showProviderModel.info.level == 2 ?4 : 3);
      });
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
      child: Scaffold(
        body: registerFunction.showProviderLoading.value ?
            loading(color: Theme.of(context).primaryColorDark):
            CustomScrollView(
              physics: PageScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                      color: Colors.white,
                      iconSize: 20,
                      icon: Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Get.back();
                      }),
                  elevation: 0.0,
                  floating: true,
                  flexibleSpace: _infoItem(),
                  expandedHeight: 220,
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabViewHeader(
                      tabController: _tabController,
                      onckick: (val) {
                        if (mounted) {
                          setState(() {
                            _select = val;
                          });
                        }
                      },
                      level: registerFunction.showProviderModel.info.level),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[_viewPage()],
                  ),
                )
              ],
            ),
      ),
    ));
  }

  _viewPage() {
    switch (_select) {
      case 0:
        return UserPackageTab(widget.uId);
        break;
      case 1:
        return ArticleTab(widget.uId);
        break;
      case 2:
        return  registerFunction.showProviderModel.info.level == 3 || registerFunction.showProviderModel.info.level == 2 ?SubsetTab(widget.uId, registerFunction.showProviderModel.info.level): GalleryTab(registerFunction.showProviderModel.info.gallery);
        break;
      case 3:
        return GalleryTab(registerFunction.showProviderModel.info.gallery);
        break;
    }
  }

  _infoItem() {
    return FlexibleSpaceBar(
      background: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(

                begin: Alignment.topRight,
                colors: [
                  Colors.grey[800],
                  Colors.grey[700],
                  Colors.grey[600],
                ]),
          ),
          height: 220,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: AspectRatio(
                                aspectRatio: 2 / 2,
                                child: imageShower(
                                    imageUrl:registerFunction.showProviderModel.info.pic,
                                    margin: EdgeInsets.all(8),
                                    fit: BoxFit.fill,
                                    borderRadius: BorderRadius.circular(100)),
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    registerFunction.showProviderModel.info.title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        registerFunction.showProviderModel.info.cell,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            registerFunction.showProviderModel.info.address,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(IntroductionPage(registerFunction.showProviderModel.info.title,
                            registerFunction.showProviderModel.info.description,
                            registerFunction.showProviderModel.info.level,
                            registerFunction.showProviderModel.info.id.toString(),
                            registerFunction.showProviderModel.info.me,
                            registerFunction.showProviderModel.info.activity_scope,
                            registerFunction.showProviderModel.info.my_level,
                            registerFunction.showProviderModel.info.i_am_subset));
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.white)
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red)),
                      child: Text(
                        "معرفی",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ),
                  ),
                  registerFunction.showProviderModel.info.me == 0 ?SizedBox(
                    width: 8,
                  ):SizedBox(),
                  registerFunction.showProviderModel.info.me == 0 ?Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          registerFunction.showProviderModel.info.following ==0?
                              registerFunction.follow(_token,  registerFunction.showProviderModel.info.id.toString()).whenComplete((){
                                listSnackBar(list: registerFunction.errorMassages, err: registerFunction.checkerror.value);
                                if(!registerFunction.checkerror.value){
                                  if(mounted){
                                    setState(() {
                                      followLoading = true;
                                    });
                                  }
                                  // registerFunction.showProviderLoading.value= true;
                                  registerFunction.showProvider(token: _token, bId: widget.uId).whenComplete((){
                                    if(mounted){
                                      setState(() {
                                        followLoading = false;
                                      });
                                    }
                                  });
                                }
                              })
                              :registerFunction.unFollow(_token, registerFunction.showProviderModel.info.following.toString()).whenComplete((){
                                listSnackBar(list: registerFunction.errorMassages, err: registerFunction.checkerror.value);
                                if(!registerFunction.checkerror.value){
                                  // registerFunction.showProviderLoading.value= true;
                                  if(mounted){
                                    setState(() {
                                      followLoading = true;
                                    });
                                  }
                                  registerFunction.showProvider(token: _token, bId: widget.uId).whenComplete((){
                                    if(mounted){
                                      setState(() {
                                        followLoading = false;
                                      });
                                    }
                                  });
                                }
                              });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white)),
                        child:   followLoading ? Center(
                          child: SpinKitThreeBounce(
                            color: Theme.of(context).primaryColorDark,
                            size: 20.0,
                          ),
                        ):Text(
                         registerFunction.showProviderModel.info.following ==0? "دنبال کردن":"حذف از دنبال کردن",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        )),
                  ):SizedBox(),
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  _dialogShoInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Dialog(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  width:Get.width,
                  height: Get.height / 1.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[800], width: 1)),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red[600],
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                icon: Icon(
                                  Icons.close,
                                  size: 26,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                  child: Text(
                                "اطلاعات بیشتر",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.white),
                              )),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                icon: Icon(
                                  Icons.close,
                                  size: 26,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "توضیحات:",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 16),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border:
                                          Border.all(color: Colors.grey[400]),
                                      borderRadius: BorderRadius.circular(8)),
                                        child: Text(registerFunction.showProviderModel.info.description,
                                                    textAlign: TextAlign.justify,

                                                   textDirection: TextDirection.rtl,
                                                 style: TextStyle(
                                                   height: 1.2,
                                                     fontSize: 12,color: Colors.black
                                                 ),)
                                ),
                                Text(
                                  "سطح کاربری:",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border:
                                        Border.all(color: Colors.grey[400]),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(registerFunction.showProviderModel.info.level_title,
                                      textAlign: TextAlign.justify,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          height: 1.2,
                                          fontSize: 12,color: Colors.black
                                      ),)
                                ),
                                Text(
                                  "حوزه فعالیت:",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border:
                                        Border.all(color: Colors.grey[400]),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: registerFunction.showProviderModel.info.activity_scope.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => itemHoze(context: context, index: index,data:registerFunction.showProviderModel.info.activity_scope[index]),
                                    )
                                ),
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if(mounted){
                                        setState(() {
                                          subsetLoading = true;
                                        });
                                      }
                                    subSetFunction.addSubset(_token, registerFunction.showProviderModel.info.id.toString()).then((value) {
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
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(color: Colors.white)
                                            )
                                        ),
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.red)),
                                    child: Text(
                                      "درخواست عضویت",
                                      style: TextStyle(fontSize: 14, color: Colors.white),
                                    )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

}
