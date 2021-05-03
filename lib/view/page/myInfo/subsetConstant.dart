import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sportapplication/Model/ArticleModel.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/Model/SubSetModel.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/blog/BlogDetailPage.dart';

subsetItemList(
    {@required BuildContext context,
    @required int index,
    @required SubSetPost data,
    @required onTap,
    @required acceptClick,
    @required removeReq,
    @required removeClick}) {
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
        ]),
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    margin: EdgeInsets.only(left: 6, right: 6, bottom: 10),
    child: InkWell(
      onTap: onTap,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: AspectRatio(
                      aspectRatio: 2 / 2,
                      child: imageShower(
                          imageUrl: data.pic,
                          margin: EdgeInsets.all(8),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(100)),
                    )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          data.name,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "تعداد پکیج های ارايه شده: ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${data.package_count} پکیج ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[400]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "تعداد مقالات ارايه شده: ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${data.blog_count} مقاله ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red[400]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
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
          data.i_requested == 0
              ? Row(
                  children: [
                    data.acepted ==0? Expanded(
                      child: ElevatedButton(
                        onPressed: acceptClick,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.white))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        child: Text(
                          "تایید",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ):Container(),
                    data.acepted ==0?  SizedBox(
                      width: 8,
                    ):Container(),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: removeClick,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        child: Text(
                          "حذف",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: removeReq,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.white))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red)),
                        child: Text(
                          "حذف درخواست",
                          style: TextStyle(fontSize: 12, color: Colors.white),
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

myPackageList(
    {@required BuildContext context,
    @required int index,
    @required MyPackagePost data,
    @required removePackage,
    @required editPackage,
    @required onTab}) {
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
        ]),
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    margin: EdgeInsets.only(left: 6, right: 6, bottom: 10),
    child: InkWell(
      onTap: onTab,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: imageShower(
                          imageUrl: data.pic,
                          margin: EdgeInsets.only(left: 0, right: 0),
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(8)),
                    )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          data.title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data.status_title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[400]),
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
                        SizedBox(
                          height: 6,
                        ),
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
                            "تاریخ شروع:",
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
                            "تاریخ پایان:",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            height: 1,
            color: Colors.grey[300],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: removePackage,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text(
                    "حذف پکیج",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: editPackage,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
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

myArticleList({@required BuildContext context, @required int index, @required removeArticle, @required ArticleModelPost data}) {
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
        ]),
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    margin: EdgeInsets.only(left: 6, right: 6, bottom: 10),
    child: InkWell(
      onTap: () {
        Get.to(BlogDetailPage(data.id.toString()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: AspectRatio(
                        aspectRatio: 2 / 2,
                        child: Stack(
                          children: [
                            imageShower(
                                imageUrl: data.pic,
                                margin: EdgeInsets.only(left: 0, right: 0),
                                fit: BoxFit.fill,
                                borderRadius: BorderRadius.circular(8)),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(colors: [
                                  Colors.black26,
                                  Colors.grey[800],
                                ])),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 6),
                                child: Text(
                                  "#فوتسال",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ))),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                         data.title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                                data.summary,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[700]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15 , right: 6 , bottom: 8),
            child: Text(
              data.status_title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400]),
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
                  onPressed:removeArticle,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.white))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text(
                    "حذف مقاله",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
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
