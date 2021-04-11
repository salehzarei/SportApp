import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Pages/Component/Constans.dart';
import 'package:sportapplication/Pages/Lists/PackagesListItem.dart';

import '../CategoryList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 7,
              child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKuHAf0nsL98qD2bGTD5WeWnJ4-EhnMluo_w&usqp=CAU",
                            ),
                            fit: BoxFit.fill,
                          )),
                    );
                  },
                  itemCount: 4,
                  autoplay: true,
                  pagination: SwiperPagination()
                  // viewportFraction: 0.8,
                  // scale: 0.9,
                  ),
            ),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(CategoryList());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_florist_sharp,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('مربیان')
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_florist_sharp,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('باشگاه ها')
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_florist_sharp,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('پزشکان')
                    ],
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_florist_sharp,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('فروشگاه ها')
                    ],
                  ),
                )),
              ],
            ),
            Constans().divider('پیشنهادهای ویژه'),
            PackagesListItem(),
            SizedBox(
              height: 40,
            ),
            Constans().divider('پیشنهادهای ویژه'),
            PackagesListItem(),
            SizedBox(
              height: 40,
            ),
            Constans().divider('پیشنهادهای ویژه'),
            PackagesListItem(),
            SizedBox(
              height: 40,
            ),
            Constans().divider('پیشنهادهای ویژه'),
            PackagesListItem(),
          ],
        ),
      ),
    );
  }
}
