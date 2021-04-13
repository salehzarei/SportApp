import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/lists/PackagesListItemDetail.dart';

specialList({@required context,@required controller,}){
  return GestureDetector(
    onTap: () {
      Get.to(PackagesListItemDetail());
    },
    child: Container(
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
                      color: Theme.of(context).primaryColorDark,
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
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black ,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
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
                                fontSize: 13),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${maskedText('50000')} تومان ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
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
                                Icons.visibility,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                '1,204 مرتبه',
                                style: TextStyle(color: Colors.grey[600],fontSize: 12),
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

newArticleItemList({@required context}){
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
              AspectRatio(
                aspectRatio: 4/3,
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        alignment: Alignment.bottomLeft,
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
                                    horizontal: 25, vertical: 6),
                                child: Text(
                                  "نویسنده",
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                                decoration: BoxDecoration(
                                    color:Theme.of(context).primaryColorDark,
                                    borderRadius:
                                    BorderRadiusDirectional.circular(
                                        60)),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://randomuser.me/api/portraits/men/43.jpg")),
                                  borderRadius:
                                  BorderRadiusDirectional.circular(60)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اخبار جدید درباره فوتسال',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16,color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "خلاصه قوانین داوری فوتبال\nقانون اول:\nزمین مسابقه : طول نباید بیشتر از ۱۲۰ متر و کمتر از ۹۰ متر و عرض آن بیش از ۹۰ متر\nو کمتر از ۴۵ متر باشد. در مسابقات بین المللی طول زمین مسابقه نباید \nبیش از ۱۱۰ متر و کمتر از ۱۰۰ متر و عرض آن بیش از ۷۵ متر و کمتر از ۶۴ متر باشد.\nنکات مهم:\nارتفاع میله پرچم نقطه کرنر حداقل ۱۵۰ سانتیمتر",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 12,color: Colors.black),
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                               '#فوتسال',
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
                  ),
                ),
              )
            ],
          ),
        ),
      )
  );
}

packageMe({@required context,@required controller}){
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
                      color: Theme.of(context).primaryColorDark,
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
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
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
                                fontSize: 13),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${maskedText('50000')} تومان ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.visibility,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                '1,204 مرتبه',
                                style: TextStyle(color: Colors.grey[600],fontSize: 12),
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

articleMe({@required context}){
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
             AspectRatio(
               aspectRatio: 5/3,
               child: Stack(
                 children: [
                   Container(
                     margin: EdgeInsets.only(bottom: 15),
                     alignment: Alignment.bottomLeft,
                     child: imageShower(margin: EdgeInsets.all(0),
                         borderRadius:  BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                         imageUrl: "https://assets1.risnews.com/styles/content_sm/s3/2019-09/Big_Lots_CliftonPlaza.jpg?itok=5K_InGyc",
                         fit: BoxFit.fill),
                     decoration: BoxDecoration(
                       // color: Colors.grey,
                       borderRadius: BorderRadius.circular(15),
                     ),
                   ),
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: Container(
                       height: 30,
                       width: double.infinity,
                       margin: EdgeInsets.symmetric(horizontal: 16),
                       decoration: BoxDecoration(
                           color:Theme.of(context).primaryColorDark,
                           borderRadius: BorderRadius.circular(15)
                       ),
                       child: Center(
                         child: Text(
                           "نویسنده",
                           overflow: TextOverflow.clip,
                           maxLines: 1,
                           style: TextStyle(
                               color: Colors.white, fontSize: 12),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             Expanded(
               child: SingleChildScrollView(
                 child: Container(
                   padding: EdgeInsets.all(10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'اخبار جدید درباره فوتسال',
                         overflow: TextOverflow.clip,
                         maxLines: 1,
                         style: TextStyle(
                             fontWeight: FontWeight.bold, fontSize: 15),
                       ),
                       SizedBox(height: 10),
                       Text(
                         "خلاصه قوانین داوری فوتبال\nقانون اول:\nزمین مسابقه : طول نباید بیشتر از ۱۲۰ متر و کمتر از ۹۰ متر و عرض آن بیش از ۹۰ متر\nو کمتر از ۴۵ متر باشد. در مسابقات بین المللی طول زمین مسابقه نباید \nبیش از ۱۱۰ متر و کمتر از ۱۰۰ متر و عرض آن بیش از ۷۵ متر و کمتر از ۶۴ متر باشد.\nنکات مهم:\nارتفاع میله پرچم نقطه کرنر حداقل ۱۵۰ سانتیمتر",
                         overflow: TextOverflow.clip,
                         style: TextStyle(fontSize: 12),
                         maxLines: 2,
                       ),
                       SizedBox(height: 4),
                       Text(
                         '#فوتسال',
                         textAlign: TextAlign.right,
                         maxLines: 1,
                         overflow: TextOverflow.clip,
                         style:
                         TextStyle(color: Colors.red, fontSize: 12),
                       ),
                     ],
                   ),
                 ),
               ),
             )
           ],
         ),
       ),
     ));
}

followingItem(){
  return GestureDetector(
      child: Transform.translate(
        offset: Offset(0,-40),
        child: Container(
          margin: EdgeInsets.only(left: 6),
          width:  Get.width*.3,
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0,Get.width*.3+30),
                child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center( child:Text(
                      "نام فالو شونده",
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),)
                ),
              ),
              Container(
                width:  Get.width*.3,
                height:  Get.width*.3,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                margin: EdgeInsets.only(bottom: 6),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "https://randomuser.me/api/portraits/men/43.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    margin: EdgeInsets.all(0.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Container(
                      margin: EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/icon.png')),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                )
              ),

            ],
          ),
        ),
      ));
}

suggestedUser({@required context}){
  double _width = Get.width * 0.50;
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(left: 10,top:_width * 0.30 ),
      child: Column(
        children: [
          Container(
            width: _width * 0.75,
            height: _width *.65,
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Container(
                    height: _width,
                    width: _width,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          height:  _width * 0.15,
                        ),
                        Expanded(child: Center(
                          child:  Text(
                            "نوع کاربری",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.only(left: 10,right: 10 , bottom: 6),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'تعداد پکیج',
                                style: TextStyle(
                                    fontSize:14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200),
                              ),
                              Text(
                                '4',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize:14,
                                    color: Colors.yellow.shade700),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0 ,- _width * 0.29),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl:"https://randomuser.me/api/portraits/men/43.jpg",
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                width: _width * 0.46,
                                height: _width * 0.46,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  // shape: BoxShape.circle,
                                  borderRadius:
                                  BorderRadius.circular(60),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.grey[100],
                                child: Container(
                                  width: _width * 0.46,
                                  height: _width * 0.46,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'images/icon.png')),
                                      borderRadius:
                                      BorderRadius.circular(60)),
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, -18.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius:
                                BorderRadiusDirectional
                                    .circular(40)),
                            child: Text(
                             "نام کاربری",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}