import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/ArticleModel.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/Model/SliderModel.dart';
import 'package:sportapplication/Model/providerModel.dart';
import 'package:sportapplication/controller/Functions/AppFunction.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/home/HomeItemList.dart';
import 'package:sportapplication/view/page/viewAll/ViewAllPage.dart';

import '../category/CategoryList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Controller controller = Get.put(Controller());
  final SliderFunction slider = Get.put(SliderFunction());
  final PackageFunction packageFunction = Get.put(PackageFunction());
  final RegisterFunction registerFunction = Get.put(RegisterFunction());
  final ArticleFunction articleFunction = Get.put(ArticleFunction());
  final AppFunction appFunction = Get.put(AppFunction());

  MyPackageModel _specialPackage;
  MyPackageModel _interestPackage;

  List<SliderModel> sliderList = [];

  bool _sliderLoading = true;

  bool _specialPackageLoading = true;
  bool _interestPackageLoading = true;

  bool _followProviderLoading = true;
  bool _specialProviderLoading = true;

  bool _newBlogLoading = true;
  bool _interestBlogLoading = true;

  ArticleModel _newBlogModel;
  ArticleModel _interestBlogModel;

  ProviderModel _followProviderModel;
  ProviderModel _specialProviderModel;

  @override
  void initState() {
    getShared("token").then((token) {

      appFunction.getDivider();

      articleFunction.blogList(token: token, folowing: '', interest: '', uid: '', page: '', order: '', catId: '', favorite: '', word: '', tag: '', limit: '', sort: '', asc: '').whenComplete((){
        if(!articleFunction.blogLoading.value){
          if(mounted){
            setState(() {

              _newBlogModel= articleFunction.blogModel;
              _newBlogLoading = false;
            });
          }
          articleFunction.blogList(token: token, folowing: '', interest: '1', uid: '', page: '', order: '', catId: '', favorite: '', word: '', tag: '', limit: '', sort: '', asc: '').whenComplete((){
            if(!articleFunction.blogLoading.value){
              if(mounted){
                setState(() {
                  _interestBlogModel= articleFunction.blogModel;
                  _interestBlogLoading = false;
                });
              }
            }
          });
        }
      });
      packageFunction
          .geUserPackageList(
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
          limit: '10',
          page: '1',
          level: '')
          .whenComplete(() {
        if (!packageFunction.userPackageLoading.value) {
          if (mounted) {
            setState(() {
              _specialPackage = packageFunction.userPackageModel;
              _specialPackageLoading = false;
            });
          }
          packageFunction
              .geUserPackageList(
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
              limit: '10',
              page: '1',
              level: '')
              .whenComplete(() {
            if (!packageFunction.userPackageLoading.value) {
              if (mounted) {
                setState(() {
                  _interestPackage = packageFunction.userPackageModel;
                  _interestPackageLoading = false;
                });
              }
            }
          });
        }
      });
      registerFunction
          .providers(
        token: token,
        following: '1', activity_scope: '', special: '', level: '',
      ).whenComplete(() {
        if (mounted) {
          setState(() {
            _followProviderLoading = false;
            _followProviderModel = registerFunction.providerList;
          });
        }
        registerFunction
            .providers(
          token: token,
          following: '',
          level: '',
          activity_scope: '',
          special: '1',
        ).whenComplete(() {
          if (mounted) {
            setState(() {
              _specialProviderLoading = false;
              _specialProviderModel = registerFunction.providerList;
            });
          }
        });
      });
    });
    slider.getSlider().then((value) {
      if (mounted) {
        setState(() {
          sliderList = value;
          _sliderLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            sliderWidget(
                length: sliderList.length,
                loading: _sliderLoading,
                context: context,
                list: sliderList,
                margin: EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(10),
                fit: BoxFit.cover,
                aspectRatio: 16 / 7,
                lisString: false),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _itemCategory(context, 'assets/svg/coach.svg', 'مربیان', 3),
                SizedBox(
                  width: 30,
                ),
                _itemCategory(context, 'assets/svg/doctor.svg', 'پزشکان', 4),
                SizedBox(
                  width: 30,
                ),
                _itemCategory(context, 'assets/svg/gym.svg', 'باشگاهها', 2),
                SizedBox(
                  width: 30,
                ),
                _itemCategory(context, 'assets/svg/shop.svg', 'فروشگاهها', 5),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            divider(title: 'پکیج های پیشنهادی', callback: () {
              Get.to(ViewAllPage(1));
            }),
            SizedBox(
              height: 13,
            ),
            Container(
              height: Get.width * .53,
              child: !_specialPackageLoading
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _specialPackage.post.length,
                      shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => packageMe(
                          context: context,
                          controller: controller,
                          data: _specialPackage.post[index]))
                  : loading(color: Theme.of(context).primaryColorDark),
            ),
            divider(title: 'جدید ترین مقالات', callback: () {
              Get.to(ViewAllPage(3));
            }),
            Container(
              height: Get.width * .65,
              child:_newBlogLoading? loading(color: Theme.of(context).primaryColorDark): ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: _newBlogModel.post.length,
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      newArticleItemList(context: context,data: _newBlogModel.post[index])),
            ),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: imageShower(
                  imageUrl:appFunction.getDividerLoading.value?
                  'https://dkstatics-public.digikala.com/digikala-adservice-banners/c7cc9b7a063cfe5fb6665d0e53e430acb6fff847_1617785021.jpg':
                  appFunction.dividerModel.content[0].pic,
                  margin: EdgeInsets.all(10),
                  fit: BoxFit.fill,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: imageShower(
                        imageUrl:appFunction.getDividerLoading.value?
                            'https://dkstatics-public.digikala.com/digikala-adservice-banners/956cd52f1f18f11284016c86561d53bcdcfdeedd_1612606849.jpg?x-oss-process=image/quality,q_80':
                            appFunction.dividerModel.content[1].pic,
                        margin: EdgeInsets.only(left: 6, right: 10),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: imageShower(
                        imageUrl:appFunction.getDividerLoading.value?
                            'https://dkstatics-public.digikala.com/digikala-adservice-banners/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116.jpg?x-oss-process=image/quality,q_80':
                        appFunction.dividerModel.content[2].pic,
                        margin: EdgeInsets.only(left: 10, right: 6),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
            divider(title: 'پکیج های مرتبط', callback: () {
              Get.to(ViewAllPage(2));
            }),
            Container(
              height: Get.width * .53,
              child: !_interestPackageLoading
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _interestPackage.post.length,
                      shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => packageMe(
                          context: context,
                          controller: controller,
                          data: _interestPackage.post[index]))
                  : loading(color: Theme.of(context).primaryColorDark),
            ),
            divider(title: 'مقالات مرتبط', callback: () {
              Get.to(ViewAllPage(4));
            }),
            Container(
              height: Get.width * .53,
              child: _interestBlogLoading? loading(color: Theme.of(context).primaryColorDark):ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: _interestBlogModel.post.length,
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => articleMe(context: context,data: _interestBlogModel.post[index])),
            ),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: imageShower(
                  imageUrl:appFunction.getDividerLoading.value?
                      'https://dkstatics-public.digikala.com/digikala-adservice-banners/cfd7950b634d48c5fb2891b54e6bed8c6749e2e4_1618057187.jpg?x-oss-process=image/quality,q_80':
                  appFunction.dividerModel.content[3].pic,
                  margin: EdgeInsets.all(10),
                  fit: BoxFit.fill,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: imageShower(
                        imageUrl:appFunction.getDividerLoading.value?
                            'https://dkstatics-public.digikala.com/digikala-adservice-banners/4733b740d15e74f00d50ac92fb126911632b8053_1599385682.jpg?x-oss-process=image/quality,q_80':
                        appFunction.dividerModel.content[4].pic,
                        margin: EdgeInsets.only(left: 6, right: 10),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: imageShower(
                        imageUrl:appFunction.getDividerLoading.value?
                            'https://dkstatics-public.digikala.com/digikala-adservice-banners/76998daf25428efd1a62130b631abfe65b2ceea8_1612288934.jpg?x-oss-process=image/quality,q_80':
                        appFunction.dividerModel.content[5].pic,
                        margin: EdgeInsets.only(left: 10, right: 6),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: imageShower(
                  imageUrl:appFunction.getDividerLoading.value?
                      'https://dkstatics-public.digikala.com/digikala-adservice-banners/b6c47e53eeab9b91ddd2797244dfa3b6cc7919d6_1618152479.jpg?x-oss-process=image/quality,q_80':
                  appFunction.dividerModel.content[6].pic,
                  margin: EdgeInsets.all(10),
                  fit: BoxFit.fill,
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 4,
            ),
            divider(title: 'پیشنهادات اسپورت پلاس', callback: () {
              Get.to(ViewAllPage(5));
            }),
            Container(
              height: Get.width * 0.5,
              child: _specialProviderLoading
                  ? loading(color: Theme.of(context).primaryColorDark)
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _specialProviderModel.post.length,
                      shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => suggestedUser(
                          context: context,
                          data: _specialProviderModel.post[index])),
            ),
            divider(title: 'دنبال شونده ها', callback: () {
              Get.to(ViewAllPage(6));
            }),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              height: Get.width * .4,
              child: _followProviderLoading
                  ? loading(color: Theme.of(context).primaryColorDark)
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _followProviderModel.post.length,
                      shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => followingItem(
                          data: _followProviderModel.post[index])),
            ),
            // PackagesListItem(),
          ],
        ),
      ),
    );
  }

  _itemCategory(context, String image, String name, int from) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryList(
              from: from,
              level: from,
              title: name,
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // #F47651
          // #E8374C
          SvgPicture.asset(
            image,
            width: 38,
            height: 38,
            color: Colors.red[300],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w200),
          )
        ],
      ),
    );
  }
}
