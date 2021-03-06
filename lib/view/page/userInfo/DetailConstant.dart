import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/ArticleModel.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/Model/SubSetModel.dart';
import 'package:sportapplication/Model/showProviderModel.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/blog/BlogDetailPage.dart';
import 'package:sportapplication/view/page/packageDetail/PackagesListItemDetail.dart';
import 'package:sportapplication/view/page/userInfo/DetailUserInfoPage.dart';

itemPackageUserList({@required BuildContext context, @required int index, @required MyPackagePost data}) {
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
        Get.to(PackagesListItemDetail(data.id.toString()
        ));
      },
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(flex: 2,
                    child: AspectRatio(aspectRatio: 2 / 2,
                      child: imageShower(imageUrl: data.pic,
                          margin: EdgeInsets.only(left: 0, right: 0),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(8)),)),
                SizedBox(width: 8,),
                Expanded(flex: 5, child: Column(
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
                    Text("?????????? ??????????: ${data.hits}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400]
                      ),),
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
                              '${maskedText(data.price.toString())} ?????????? ',
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
          ),
          data.discount == 0
              ? Container()
              : Padding(
            padding:
            EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "?????????? ???????? : ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      data.sdate,
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "?????????? ?????????? : ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      data.edate,
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    ),
  );
}

itemHoze({@required BuildContext context, @required int index, @required ActivityScope data}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    child: Text(
      "- ${data.title}",
        style: TextStyle(
            height: 1.2,
            fontSize: 12,color: Colors.black
        )
    ),
  );
}

itemArticleUserList({@required BuildContext context, @required int index,@required ArticleModelPost data}) {
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
                        child: Text("#????????????" ,maxLines: 1, style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),),
                      ),
                    )
                  ],
                ))),
            SizedBox(width: 8,),
            Expanded(flex: 5, child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),
                Text(data.title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
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

itemSubsetUserList({@required BuildContext context, @required int index, @required SubSetPost data}) {
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
        Get.to(DetailUserInfoPage("0"));
      },
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(flex: 2,
                    child: AspectRatio(aspectRatio: 2 / 2,
                      child: imageShower(imageUrl: data.pic,
                          margin: EdgeInsets.all(8),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(100)),)),
                SizedBox(width: 8,),
                Expanded(flex: 5, child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6,),
                    Text(data.name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("?????????? ???????? ?????? ?????????? ??????: ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        SizedBox(width: 8,),
                        Text("${data.package_count} ????????",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[400]
                          ),),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("?????????? ???????????? ?????????? ??????: ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        SizedBox(width: 8,),
                        Text("${data.blog_count} ??????????",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.red[400]
                          ),),
                      ],
                    ),
                    SizedBox(height: 6,),
                  ],
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            height: 1,
            color: Colors.grey[300],
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18,
                  color: Colors.grey[600]),
              SizedBox(width: 8,),
              Text(data.address,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey[800]
                ),),
            ],
          ),
        ],
      ),
    ),
  );
}

userInfoDivider({@required String title}){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(
            fontSize: 15 ,
            fontWeight: FontWeight.w200,
            color: Colors.black
        ),),
        SizedBox(
          width: 8,
        ),
        Expanded(child: Container(
          color: Colors.grey[600],
          height: 1,
        ))
      ],
    ),
  );
}


