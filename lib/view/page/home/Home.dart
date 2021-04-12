import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/lists/PackagesListItem.dart';
import 'package:sportapplication/view/page/home/HomeItemList.dart';

import '../category/CategoryList.dart';

class Home extends StatelessWidget {
  List<String> sliders = [
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/d8f5a15935d9baed2f6c9f62b48e16c005585500_1617784806.jpg",
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/28dd964b0f4f208fcaef1b063e0a21966135a71d_1606837205.jpg",
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/add1294ad889261aaf8f330e411e80178a2d70ff_1617637271.jpg",
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/93c450a61b4348187372630713dae60f41856fb6_1618061633.jpg",
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/34e89b808da8d22d85cab948c4a68a85745dcbee_1618168208.jpg",
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/b02ac3505c453ea6eb5f5c962d53ebb605256d02_1618210848.jpg",
    "https://dkstatics-public.digikala.com/digikala-adservice-banners/29c5c2a1f36b62f68b5fb674ac89e330bce03c3b_1608640379.jpg"
  ];
  final Controller controller = Get.put(Controller());
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
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return imageShower(imageUrl: sliders[index],
                        margin: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(10), fit: BoxFit.cover);
                  },
                  itemCount: sliders.length,
                  autoplay: true,
                  duration: 5,
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
                _itemCategory(context, 'assets/svg/coach.svg', 'مربیان'),
                SizedBox(width: 20,),
                _itemCategory(context, 'assets/svg/doctor.svg', 'پزشکان'),
                SizedBox(width: 20,),
                _itemCategory(context, 'assets/svg/gym.svg', 'باشگاهها'),
                SizedBox(width: 20,),
                _itemCategory(context, 'assets/svg/shop.svg', 'فروشگاهها'),
                // Expanded(
                //     child: GestureDetector(
                //       onTap: () {
                //         Get.to(CategoryList());
                //       },
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Icon(
                //             Icons.local_florist_sharp,
                //             size: 40,
                //             color: Theme
                //                 .of(context)
                //                 .primaryColor,
                //           ),
                //           SizedBox(
                //             height: 5,
                //           ),
                //           Text('مربیان')
                //         ],
                //       ),
                //     )),
                // Expanded(
                //     child: GestureDetector(
                //       onTap: () {},
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Icon(
                //             Icons.local_florist_sharp,
                //             size: 40,
                //             color: Theme
                //                 .of(context)
                //                 .primaryColor,
                //           ),
                //           SizedBox(
                //             height: 5,
                //           ),
                //           Text('باشگاه ها')
                //         ],
                //       ),
                //     )),
                // Expanded(
                //     child: GestureDetector(
                //       onTap: () {},
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Icon(
                //             Icons.local_florist_sharp,
                //             size: 40,
                //             color: Theme
                //                 .of(context)
                //                 .primaryColor,
                //           ),
                //           SizedBox(
                //             height: 5,
                //           ),
                //           Text('پزشکان')
                //         ],
                //       ),
                //     )),
                // Expanded(
                //     child: GestureDetector(
                //       onTap: () {},
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Icon(
                //             Icons.local_florist_sharp,
                //             size: 40,
                //             color: Theme
                //                 .of(context)
                //                 .primaryColor,
                //           ),
                //           SizedBox(
                //             height: 5,
                //           ),
                //           Text('فروشگاه ها')
                //         ],
                //       ),
                //     )),
              ],
            ),
            SizedBox(height: 6,),
            divider(title: 'پکیج های پیشنهادی', callback: () {}),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              height: Get.width*.53 ,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
              margin: EdgeInsets.only(bottom: 8),
              height: Get.width*.8 ,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  itemCount:4,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      newArticleItemList()
              ),
            ),
            SizedBox(
              height: 40,
            ),
            divider(title: 'پکیج های مرتبط', callback: () {}),
            PackagesListItem(),
            SizedBox(
              height: 40,
            ),
            divider(title: 'مربیان پیشنهادی', callback: () {}),
            PackagesListItem(),
          ],
        ),
      ),
    );
  }

  _itemCategory(context, String image,String name) {
    return GestureDetector(
      onTap: () {
        Get.to(CategoryList());
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
