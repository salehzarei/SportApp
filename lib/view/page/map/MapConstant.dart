import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/CategoryAccountTypeModel.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/Model/showProviderModel.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/packageDetail/PackagesListItemDetail.dart';
import 'package:sportapplication/view/page/userInfo/DetailUserInfoPage.dart';


categoryItemList({@required CategoryAccountTypeModel model,@required BuildContext context,@required onTab,@required int index,@required int indexItem }){
  return InkWell(
    onTap: onTab,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
          color: indexItem == index?Theme.of(context).primaryColorDark:Colors.white,
        border: Border.all(color:indexItem == index?Theme.of(context).primaryColorDark:Colors.grey[300] , width: 1),
        // boxShadow:[
        //   BoxShadow(
        //     color: Colors.grey[300],
        //     offset: Offset(0,-2),
        //     blurRadius: 1,
        //   )
        // ]
      ),
      padding: EdgeInsets.symmetric(horizontal: 20 ),
      child: Center(
        child: Text(model.title, style: TextStyle(
          fontSize: 15 , color:indexItem == index?Colors.white: Colors.grey[600]
        ),),
      ),
    ),
  );
}

categoryItemList1({@required String title,@required BuildContext context,@required onTab,@required int index,@required int indexItem }){
  return InkWell(
    onTap: onTab,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    child: Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: indexItem == index?Theme.of(context).primaryColorDark:Colors.white,
        border: Border.all(color:indexItem == index?Theme.of(context).primaryColorDark:Colors.grey[300] , width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20 ),
      child: Center(
        child: Text(title, style: TextStyle(
            fontSize: 15 , color:indexItem == index?Colors.white: Colors.grey[600]
        ),),
      ),
    ),
  );
}

viewBellowButton({@required String title,@required IconData icon,@required  onTap}){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300] , width: 1),
        boxShadow:[
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(0,-3),
            blurRadius: 4,
          )
        ]
    ),
    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 12),
    child: InkWell(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,size: 18,color:Colors.grey[600],),
            SizedBox(width: 6,),
            Text(title , style: TextStyle(
                fontSize: 15 , color: Colors.grey[600]
            ),),
          ],
        ),
      ),
    ),
  );
}

itemPackageList({@required BuildContext context,@required int index,@required MyPackagePost data}){
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
            child: Text(data.owner,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),),
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
                Expanded(flex:2,child:  AspectRatio(aspectRatio: 4/3,child: imageShower(imageUrl: data.pic,
                    margin: EdgeInsets.only(left: 0,right: 0), fit: BoxFit.fill, borderRadius: BorderRadius.circular(8)),)),
                SizedBox(width: 8,),
                Expanded(flex:5,child: Column(
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
                      "تاریخ شروع : ",
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
                      "تاریخ پایان : ",
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
          SizedBox(height: 6,),
        ],
      ) ,
    ),
  );
}

itemSubsetUserList({@required BuildContext context, @required ShowProviderModel data, @required onPressed}) {
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
        Get.to(DetailUserInfoPage(data.info.id.toString()));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(flex: 2,
                    child: AspectRatio(aspectRatio: 2 / 2,
                      child: imageShower(imageUrl: data.info.pic,
                          margin: EdgeInsets.all(8),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(100)),)),
                SizedBox(width: 8,),
                Expanded(flex: 5, child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.info.title,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        IconButton(icon: Icon(Icons.close , size: 20,), onPressed: onPressed)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("تعداد پکیج های ارايه شده: ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        SizedBox(width: 8,),
                        Text("${data.info.package_count} پکیج ",
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
                        Text("تعداد مقالات ارايه شده: ",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                        SizedBox(width: 8,),
                        Text("${data.info.blog_count} مقاله ",
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
              Text(data.info.address,
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

