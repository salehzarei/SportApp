import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/component/TabViewHeader.dart';
import 'package:sportapplication/view/page/userInfo/ArticleTab.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';
import 'package:sportapplication/view/page/userInfo/SubsetTab.dart';
import 'package:sportapplication/view/page/userInfo/UserPackageTab.dart';

class DetailUserInfoPage extends StatefulWidget {
  @override
  _DetailUserInfoPageState createState() => _DetailUserInfoPageState();
}

class _DetailUserInfoPageState extends State<DetailUserInfoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _select = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
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
              // centerTitle: true,
              // title: Text(
              //   "عنوان کاربری",
              //   style: TextStyle(color: Theme.of(context).accentColor),
              // ),
              floating: true,
              backgroundColor: Colors.red,
              flexibleSpace: _infoItem(),
              expandedHeight: 200,
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
                  }),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[_viewPage()],
              ),
            )
          ],
        ),
      ),
    );
  }

  _viewPage() {
    switch (_select) {
      case 0:
        return UserPackageTab();
        break;
      case 1:
        return ArticleTab();
        break;
      case 2:
        return SubsetTab();
        break;
    }
  }

  _infoItem() {
    return FlexibleSpaceBar(
      background: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                            imageUrl:
                                "https://dkstatics-public.digikala.com/digikala-adservice-banners/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116.jpg?x-oss-process=image/quality,q_80",
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
                            "نام کاربری",
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
                                "09333333333",
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
                    "آدرس ابن سینا بین ابن سینا 16 و 18",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          dialogBase(
                              context: context, child: _dialogShoInformation());
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
                        "اطلاعات بیشتر",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red)
                                )
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white)),
                        child: Text(
                          "دنبال کردن",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        )),
                  ),
                ],
              ),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                                        child: Text("توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد"
                                                     "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد",
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
                                    child: Text("مربی",
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
                                      itemCount: 5,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => itemHoze(context: context, index: index),
                                    )
                                ),
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
