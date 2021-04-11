import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PackagesListItemDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  IconButton(icon: Icon(Icons.bookmark), onPressed: () {}),
                  IconButton(icon: Icon(Icons.share), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.shopping_basket_outlined),
                      onPressed: () {}),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                            image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKuHAf0nsL98qD2bGTD5WeWnJ4-EhnMluo_w&usqp=CAU",
                            ),
                            fit: BoxFit.fill,
                          )),
                        );
                      },
                      itemCount: 10,
                      autoplay: true,
                      pagination: SwiperPagination()
                      // viewportFraction: 0.8,
                      // scale: 0.9,
                      ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('هیومن پارک تهران'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            'مشهد',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'سفری اسرارآمیز به درون بدن انسان در مجموعه تفریحی هیومن پارک تا ۳۰٪ تخفیف'),
                    ],
                  ),
                ),
                Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_basket_outlined,
                              color: Colors.grey,
                            ),
                            Text('1,204 خرید')
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {},
                          // color: Theme.of(context).primaryColor,
                          child: Text(
                            '۳۰٪ تخفیف',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  child: Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('چرا مجموعه تفریحی هیومن پارک تهران'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 60,
                  child: Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ویژگی ها'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 60,
                  child: Card(
                    elevation: 10.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('شرایط استفاده'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // height: 60,
                  child: Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'درباره مجموعه تفریحی هیومن پارک تهران',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(
                                  'مشهد , ابن سینا , بین ابن سینا ۱۸ و ۱۶ , پلاک ۲۷')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  // height: 60,
                  child: Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lock_clock,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'ساعت سرویس دهی',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ساعت ۱۰ الی ۱۹:۳۰')
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.blue)),
                            child: Icon(
                              Icons.call,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  // height: 60,
                  child: Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'روز های سرویس دهی',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('همه روزه')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
