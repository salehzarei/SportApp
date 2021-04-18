
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

itemPackageFav({@required BuildContext context,@required int index}){
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

      },
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:EdgeInsets.only(right: 8 , top: 6 , bottom: 10),
            child: Text("سیاره فوتسال",
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
              Text("پنج راه سناباد بین ابن سینای 16 و 18 پلاک 210",
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
                    child:  AspectRatio(aspectRatio: 2/2,child: imageShower(imageUrl: index%2 == 0?
                    'https://dkstatics-public.digikala.com/digikala-adservice-banners/956cd52f1f18f11284016c86561d53bcdcfdeedd_1612606849.jpg?x-oss-process=image/quality,q_80':
                    "https://dkstatics-public.digikala.com/digikala-adservice-banners/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116.jpg?x-oss-process=image/quality,q_80",
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
                        Text("دوره تاکتیک در فوتسال",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),),
                        SizedBox(height: 8,),
                        Text("25 خرید",
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
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.favorite,color: Colors.red,size: 22,)),
                          ],),
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

itemArticleFav({@required BuildContext context,@required int index}){
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
      child: IntrinsicHeight(
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
                      child: Text("بدنسازی مدرن در فوتسال",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                    ),
                    SizedBox(width: 4,),
                    Icon(Icons.favorite,color: Colors.red,size: 22,),
                  ],
                ),
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
    ),
  );
}

