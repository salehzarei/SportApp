import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/SliderModel.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/home/HomeItemList.dart';

import '../category/CategoryList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Controller controller = Get.put(Controller());
  final SliderFunction slider = Get.put(SliderFunction());
  List<SliderModel> sliderList = [];
  bool _sliderLoading = true;
  @override
  void initState() {
     slider.getSlider().then((value) {
       print("getslider");
       print(value.length);
       if(mounted){
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
            AspectRatio(
              aspectRatio: 16 / 7,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: _sliderLoading? Center(
                  child: SpinKitThreeBounce(
                    color: Theme.of(context).primaryColorDark,
                    size: 25.0,
                  ),
                ):Swiper(
                  itemCount: sliderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return imageShower(imageUrl: sliderList[index].pic,
                        margin: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(10), fit: BoxFit.cover);
                  },
                  autoplay: true,
                  duration: 10,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          size: 6.0, activeSize: 10.0, space: 4.0),
                      margin: EdgeInsets.only(bottom: 20)
                  ),

                  // viewportFraction: 0.8,
                  // scale: 0.9,
                ),
              ),
            ),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _itemCategory(context, 'assets/svg/coach.svg', 'مربیان',3),
                SizedBox(width: 30,),
                _itemCategory(context, 'assets/svg/doctor.svg', 'پزشکان',4),
                SizedBox(width: 30,),
                _itemCategory(context, 'assets/svg/gym.svg', 'باشگاهها',2),
                SizedBox(width: 30,),
                _itemCategory(context, 'assets/svg/shop.svg', 'فروشگاهها',5),
              ],
            ),
            SizedBox(height: 13,),
            divider(title: 'پکیج های پیشنهادی', callback: () {}),
            SizedBox(height: 13,),
            Container(
              height: Get.width*.53 ,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount:4,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      specialList(context: context, controller: controller)
              ),
            ),
            divider(title: 'جدید ترین مقالات', callback: () {}),
            Container(
              height: Get.width*.65,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount:4,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      newArticleItemList(context: context)
              ),
            ),
            AspectRatio(aspectRatio: 16/6,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/c7cc9b7a063cfe5fb6665d0e53e430acb6fff847_1617785021.jpg',
                margin: EdgeInsets.all(10), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),),
            Row(children: [
              Expanded(
                flex: 1,
                child:  AspectRatio(aspectRatio: 16/9,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/956cd52f1f18f11284016c86561d53bcdcfdeedd_1612606849.jpg?x-oss-process=image/quality,q_80',
                    margin: EdgeInsets.only(left: 6,right: 10), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),)
                ,),
              Expanded(
                flex: 1,
                child:  AspectRatio(aspectRatio: 16/9,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116.jpg?x-oss-process=image/quality,q_80',
                    margin: EdgeInsets.only(left: 10,right: 6), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),)
                ,)
            ],),
            divider(title: 'پکیج های مرتبط', callback: () {}),
            Container(
              height: Get.width*.53 ,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount:4,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      packageMe(context: context, controller: controller)
              ),
            ),
            divider(title: 'مقالات مرتبط', callback: () {}),
            Container(
              height: Get.width*.53 ,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount:4,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      articleMe(context: context)
              ),
            ),
            AspectRatio(aspectRatio: 16/6,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/cfd7950b634d48c5fb2891b54e6bed8c6749e2e4_1618057187.jpg?x-oss-process=image/quality,q_80',
                margin: EdgeInsets.all(10), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),),
            Row(children: [
              Expanded(
                flex: 1,
                child:  AspectRatio(aspectRatio: 16/9,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/4733b740d15e74f00d50ac92fb126911632b8053_1599385682.jpg?x-oss-process=image/quality,q_80',
                    margin: EdgeInsets.only(left: 6,right: 10), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),)
                ,),
              Expanded(
                flex: 1,
                child:  AspectRatio(aspectRatio: 16/9,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/76998daf25428efd1a62130b631abfe65b2ceea8_1612288934.jpg?x-oss-process=image/quality,q_80',
                    margin: EdgeInsets.only(left: 10,right: 6), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),)
                ,)
            ],),
            AspectRatio(aspectRatio: 16/6,child: imageShower(imageUrl: 'https://dkstatics-public.digikala.com/digikala-adservice-banners/b6c47e53eeab9b91ddd2797244dfa3b6cc7919d6_1618152479.jpg?x-oss-process=image/quality,q_80',
                margin: EdgeInsets.all(10), fit: BoxFit.fill, borderRadius: BorderRadius.circular(10)),),
            SizedBox(height: 4,),
            divider(title: 'پیشنهادات اسپورت پلاس', callback: () {}),
            Container(
              height: Get.width * 0.5,
              child:ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount:4,
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      suggestedUser(context: context)
              ),
            ),
            divider(title: 'دنبال شونده ها', callback: () {}),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              height:Get.width*.4,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount:4,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      followingItem()
              ),
            ),
            // PackagesListItem(),
          ],
        ),
      ),
    );
  }

  _itemCategory(context, String image,String name,int from) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryList(from: from, level: from, title: name,));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 38,
            height: 38,
            color: Colors.red[300],
          ),
          SizedBox(height: 8,),
          Text(name , style: TextStyle(fontSize: 14 , color: Colors.black , fontWeight: FontWeight.w200),)
        ],
      ),
    );
  }
}
