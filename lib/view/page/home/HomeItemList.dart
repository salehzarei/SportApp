import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sportapplication/Model/ArticleModel.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/Model/providerModel.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/blog/BlogDetailPage.dart';
import 'package:sportapplication/view/page/packageDetail/PackagesListItemDetail.dart';
import 'package:sportapplication/view/page/userInfo/DetailUserInfoPage.dart';

specialList({@required context,@required controller,@required MyPackagePost data}){
  return GestureDetector(
    onTap: () {
      Get.to(PackagesListItemDetail(data.id.toString()));
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
                    child:imageShower(margin: EdgeInsets.all(0),
                        borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                        imageUrl: data.pic,
                        fit: BoxFit.fill),
                  ),
                ),
               data.discount==0?SizedBox():Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    data.discount_type==1?'${data.discount}%':data.discount,
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
                       data.title,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black ,
                            fontWeight: FontWeight.w100,
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
                            Expanded(child: Text( data.owner,style: TextStyle(color: Colors.black , fontWeight: FontWeight.w100 , fontSize: 12),)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          data.discount == 0?SizedBox():Text(
                            maskedText(data.price.toString()),
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
                            width:  data.discount == 0?5:0,
                          ),
                          Text(
                            '${maskedText(data.final_price.toString())} تومان ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w100,
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
                                '${data.hits} بازدید ',
                                style: TextStyle(color: Colors.grey[600],fontSize: 12),
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow,
                          //       size: 15,
                          //     ),
                          //     Text(
                          //       '2.6',
                          //       style: TextStyle(color: Colors.grey),
                          //     )
                          //   ],
                          // )
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

newArticleItemList({@required context,@required ArticleModelPost data}){
  return GestureDetector(
    onTap: () {
      Get.to(BlogDetailPage(data.id.toString()));
    },
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
                        child: imageShower(margin: EdgeInsets.all(0),
                            borderRadius:  BorderRadius.circular(15),
                            imageUrl: data.pic,
                            fit: BoxFit.fill),
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
                                  data.owner,
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
                                          data.owner_pic)),
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
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16,color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            data.summary,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 12,color: Colors.black),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          data.tages.isEmpty?"#":data.tages[0],
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
              )
            ],
          ),
        ),
      )
  );
}

packageMe({@required context,@required controller,@required MyPackagePost data}){
  return GestureDetector(
    onTap: () {
      Get.to(PackagesListItemDetail(data.id.toString()));
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
                        topRight: Radius.circular(6)),
                        imageUrl: data.pic,
                        fit: BoxFit.fill),
                  ),
                ),
                data.discount==0?SizedBox():Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(6))),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    data.discount_type==1?'${data.discount}%':data.discount,
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
                        data.title,
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
                          data.discount == 0?SizedBox():Text(
                            maskedText(data.price.toString()),
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
                            width:  data.discount == 0?5:0,
                          ),
                          Text(
                            '${maskedText(data.final_price.toString())} تومان ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w100,
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
                                '${data.hits} مرتبه',
                                style: TextStyle(color: Colors.grey[600],fontSize: 12),
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.yellow,
                          //       size: 15,
                          //     ),
                          //     Text(
                          //       '2.6',
                          //       style: TextStyle(color: Colors.grey),
                          //     )
                          //   ],
                          // )
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

articleMe({@required context,@required ArticleModelPost data}){
 return GestureDetector(
     onTap: () {
       Get.to(BlogDetailPage(data.id.toString()));
   },
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
                         imageUrl: data.pic,
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
                         data.owner,
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
                        data.title,
                         overflow: TextOverflow.clip,
                         maxLines: 1,
                         style: TextStyle(
                             fontWeight: FontWeight.w100, fontSize: 15),
                       ),
                       SizedBox(height: 10),
                       Text(
                         data.summary,
                         overflow: TextOverflow.clip,
                         style: TextStyle(fontSize: 12),
                         maxLines: 2,
                       ),
                       SizedBox(height: 4),
                       Text(
                         data.tages.isEmpty?"#":data.tages[0],
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

followingItem({@required ProviderPost data}){
  return GestureDetector(
      onTap: () {
        Get.to(DetailUserInfoPage(data.id.toString()));
      },
      child: Transform.translate(
        offset: Offset(0,-40),
        child: Container(
          margin: EdgeInsets.only(left: 6),
          width:  Get.width*.26,
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0,Get.width*.26+30),
                child: Container(
                    padding: EdgeInsets.all(8),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center( child:Text(
                      data.title,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                          fontSize: 13),
                    ),)
                ),
              ),
              Container(
                width:  Get.width*.26,
                height:  Get.width*.26,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                margin: EdgeInsets.only(bottom: 6),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: data.pic,
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
                              image: AssetImage('assets/image/pish.png')),
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

suggestedUser({@required context,@required ProviderPost data}){
  double _width = Get.width * 0.50;
  return GestureDetector(
    onTap: () {
      Get.to(DetailUserInfoPage(data.id.toString()));
    },
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
                            data.title,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w100),
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
                          imageUrl:data.pic,
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
                                              'assets/image/pish.png')),
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
                             data.level_title,
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