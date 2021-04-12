import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/lists/PackagesListItemDetail.dart';

specialList({@required context,@required controller,}){
  return GestureDetector(
    onTap: () {
      Get.to(PackagesListItemDetail());
    },
    child: Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color: Colors.white,
      // ),
      margin: EdgeInsets.only(left: 6),
      width: Get.width*.5,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4/2,
                  child: Container(
                    width: double.infinity,
                    child:imageShower(margin: EdgeInsets.all(0), borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)), imageUrl: "https://assets1.risnews.com/styles/content_sm/s3/2019-09/Big_Lots_CliftonPlaza.jpg?itok=5K_InGyc", fit: BoxFit.fill),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '30%',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'هیومن پارک تهران',
                        style: TextStyle(
                            color: Colors.black ,
                            fontWeight: FontWeight.w200 ,
                            fontSize: 15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/shop.svg',
                              width: 15,
                              height: 15,
                              color: Colors.red[300],
                            ),
                            SizedBox(width: 6,),
                            Expanded(child: Text('سیاره فوتسال',style: TextStyle(color: Colors.black , fontWeight: FontWeight.w200 , fontSize: 12),)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            maskedText('75000'),
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red[800],
                                // decorationStyle: TextDecorationStyle.double,
                                decorationThickness: 1.5,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${maskedText('50000')} تومان ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_basket_outlined,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                '1,204 خرید',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              Text(
                                '2.6',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

newArticleItemList(){
  return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 6),
        width: Get.width*.5,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 150,
                      child: imageShower(margin: EdgeInsets.all(0), borderRadius:  BorderRadius.circular(15), imageUrl: "https://assets1.risnews.com/styles/content_sm/s3/2019-09/Big_Lots_CliftonPlaza.jpg?itok=5K_InGyc", fit: BoxFit.fill),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: Offset(-15.0, 0.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Text(
                                "نام نویسنده",
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                  BorderRadiusDirectional.circular(
                                      60)),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.13,
                            height: Get.width * 0.13,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://assets1.risnews.com/styles/content_sm/s3/2019-09/Big_Lots_CliftonPlaza.jpg?itok=5K_InGyc")),
                                borderRadius:
                                BorderRadiusDirectional.circular(60)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'text',
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                           '#Hashtag',
                          textAlign: TextAlign.right,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style:
                          TextStyle(color: Colors.red, fontSize: 12),
                        ),
                        Text(
                          'اطلاعات بیشتر',
                          style: TextStyle(
                              color: Colors.blue[900], fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
  );
}