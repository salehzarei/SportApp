
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/ArticleModel.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/blog/BlogDetailPage.dart';
import 'package:sportapplication/view/page/packageDetail/PackagesListItemDetail.dart';

itemPackageFav({@required BuildContext context,@required int index,@required MyPackagePost data,@required onTap,@required bool fav}){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300] , width: 1),
        boxShadow:[
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0,3),
            blurRadius: 12,
          )
        ]
    ),
    padding: EdgeInsets.symmetric(horizontal: 6 , vertical: 8),
    margin: EdgeInsets.only(left: 6 , right: 6 , bottom: 10),
    child: InkWell(
      onTap: () {
        Get.to(PackagesListItemDetail(data.id.toString()));
      },
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:EdgeInsets.only(right: 8 , top: 6 , bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.owner,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                fav?InkWell(
                  onTap: onTap,
                    child: Icon(Icons.favorite,color: Colors.red,size: 22,)
                ):SizedBox()
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined,size: 18 ,color: Colors.grey[600]),
              SizedBox(width: 8,),
              Text(data.address,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey[800]
                ),),
            ],
          ),
          SizedBox(
            height: 6,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 8),
            height: 1,
            color: Colors.grey[300],
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                    flex:2,
                    child:  AspectRatio(aspectRatio: 2/2,child: imageShower(imageUrl:data.pic,
                        margin: EdgeInsets.only(left: 0,right: 0), fit: BoxFit.fill, borderRadius: BorderRadius.circular(8)),)),
                SizedBox(
                  width: 8,),
                Expanded(
                    flex:5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6,),
                        Text(data.title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              '${ data.hits } بازدید',
                              style: TextStyle(color: Colors.grey[600],fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                data.discount == 0
                                    ? Container()
                                    : Text(
                                  maskedText(data.price.toString()),
                                  style: TextStyle(
                                      decoration:
                                      TextDecoration.lineThrough,
                                      decorationColor: Colors.red[800],
                                      // decorationStyle: TextDecorationStyle.double,
                                      decorationThickness: 1.5,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                data.discount == 0
                                    ? Container()
                                    : SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${maskedText(data.final_price.toString())} تومان ',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            data.discount == 0
                                ? Container()
                                : Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color:
                                  Theme.of(context).primaryColorDark),
                              child: Center(
                                child: Text(
                                  data.discount_type == 2
                                      ? '${data.discount} %'
                                      : data.discount.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 6,),
                      ],
                    ))
              ],
            ),
          )
        ],
      ) ,
    ),
  );
}

itemArticleFav({@required BuildContext context,@required int index,@required ArticleModelPost data,@required onTap,@required bool fav}){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300], width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0, 3),
            blurRadius: 12,
          )
        ]
    ),
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    margin: EdgeInsets.only(left: 6, right: 6, bottom: 10),
    child: InkWell(
      onTap: () {
        Get.to(BlogDetailPage(data.id.toString()));
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(flex: 2,
                child: AspectRatio(aspectRatio: 2 / 2, child: Stack(
                  children: [
                    imageShower(imageUrl: data.pic,
                        margin: EdgeInsets.only(left: 0, right: 0),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(8)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black26,
                                  Colors.grey[800],
                                ]
                            )
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 4 , vertical: 6),
                        child: Text(data.tages.isEmpty?"#":data.tages[0] ,maxLines: 1, style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                      ),
                    )
                  ],
                ))),
            SizedBox(
              width: 8,),
            Expanded(
                flex: 5,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Row(
                  children: [
                    Expanded(
                      child: Text(data.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                    ),
                    SizedBox(width: 4,),
                    fav?InkWell(
                        onTap:onTap,
                        child: Icon(Icons.favorite,color: Colors.red,size: 22,)
                    ):SizedBox(),
                  ],
                ),
                SizedBox(height: 8,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(data.summary,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700]
                      ),),
                  ),
                ),
                SizedBox(height: 6,),
              ],
            ))
          ],
        ),
      ),
    ),
  );
}

