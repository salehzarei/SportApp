import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

subsetItemList({@required BuildContext context, @required int index}) {
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
      },
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(flex: 2,
                    child: AspectRatio(aspectRatio: 2 / 2,
                      child: imageShower(imageUrl: index % 2 == 0
                          ?
                      'https://dkstatics-public.digikala.com/digikala-adservice-banners/956cd52f1f18f11284016c86561d53bcdcfdeedd_1612606849.jpg?x-oss-process=image/quality,q_80'
                          :
                      "https://dkstatics-public.digikala.com/digikala-adservice-banners/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116.jpg?x-oss-process=image/quality,q_80",
                          margin: EdgeInsets.all(8),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(100)),)),
                SizedBox(width: 8,),
                Expanded(flex: 5, child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6,),
                    Text("نام کاربری",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),),
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
                        Text("25 پکیج",
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
                        Text("11 مقاله",
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
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red)),
                  child: Text(
                    "تایید مربی",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white)),
                  child: Text(
                    "حذف مربی",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

myPackageList({@required BuildContext context, @required int index , @required MyPackagePost data}) {
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
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),),
                    SizedBox(height: 8,),
                    Text(data.status_title,
                      maxLines: 1,
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
                            data.discount ==0 ?Container(): Text(
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
                            data.discount ==0 ?Container(): SizedBox(
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
                        data.discount ==0 ?Container() : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Theme
                                  .of(context)
                                  .primaryColorDark
                          ),
                          child: Center(
                            child: Text(
                              data.discount_type == 2 ? '${data.discount} %':data.discount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13
                              ),),
                          ),
                        )
                      ],),
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
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red)),
                  child: Text(
                    "حذف پکیج",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white)),
                  child: Text(
                    "ویرایش پکیج",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

myArticleList({@required BuildContext context, @required int index}) {
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
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(flex: 2,
                    child: AspectRatio(aspectRatio: 2 / 2, child: Stack(
                      children: [
                        imageShower(imageUrl: index % 2 == 0
                            ?'https://dkstatics-public.digikala.com/digikala-adservice-banners/956cd52f1f18f11284016c86561d53bcdcfdeedd_1612606849.jpg?x-oss-process=image/quality,q_80'
                            :"https://dkstatics-public.digikala.com/digikala-adservice-banners/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116.jpg?x-oss-process=image/quality,q_80",
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
                            child: Text("#فوتسال" ,maxLines: 1, style: TextStyle(
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
                    Text("بدنسازی مدرن در فوتسال",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),),
                    SizedBox(height: 8,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text("بدن سازی مدرن در فوتسال یکی از مهم ترین ویژگی های یک بدنسازی عالی میباشد که میتوانید از سایت سیاره فوتسال پیگیری کنید",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            height: 1,
            color: Colors.grey[300],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red)),
                  child: Text(
                    "حذف مقاله",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white)),
                  child: Text(
                    "ویرایش مقاله",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

