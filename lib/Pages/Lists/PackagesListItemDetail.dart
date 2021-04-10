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
          body: Column(
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
                    ),SizedBox(
                      height: 10,
                    ),
                    Text('سفری اسرارآمیز به درون بدن انسان در مجموعه تفریحی هیومن پارک تا ۳۰٪ تخفیف')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
