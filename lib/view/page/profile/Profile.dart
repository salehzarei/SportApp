import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/favorite/FavoritePage.dart';
import 'package:sportapplication/view/page/profile/profileConstance.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black26,
                Colors.black54,
                Colors.grey[800],
                // Colors.grey[850]
              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(flex: 1,
                            child: AspectRatio(aspectRatio: 2 / 2,
                              child: imageShower(imageUrl:"https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
                                  margin: EdgeInsets.all(6),
                                  fit: BoxFit.fill,
                                  borderRadius: BorderRadius.circular(8)),)),
                        Expanded(
                            flex: 3, child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("نام کاربری",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white
                                ),),
                              SizedBox(height: 6,),
                              Text("09123456789",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white
                                ),),
                              SizedBox(height: 6,),
                              Row(children: [
                                Text("نوع کاربری:",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white
                                  ),),
                                SizedBox(width: 6,),
                                Text("فروشگاه",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white
                                  ),),
                              ],)
                            ],
                          ),
                        )),
                        Expanded(flex: 1,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: InkWell(onTap: () {
                                dialogBase(context: context, child: _showQr("https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/QR_deWP.svg/1200px-QR_deWP.svg.png"));
                              },
                                child: imageShower(imageUrl:"https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/QR_deWP.svg/1200px-QR_deWP.svg.png",
                                    margin: EdgeInsets.all(6),
                                    fit: BoxFit.fill,
                                    borderRadius: BorderRadius.circular(8))
                            ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 18,
                          color: Colors.white
                      ),
                      SizedBox(width: 8,),
                      Text("پنج راه سناباد بین ابن سینای 16 و 18 پلاک 210",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w100,
                            color: Colors.white
                        ),),
                    ],
                  ),
                ],
              ),
            ),
            itemProfile(context: context, onTap: (){
              Get.to(FavoritePage());
            } , title: "علاقه مندی ها"),
            itemProfile(context: context, onTap: (){} , title: "لیست بسته ها"),
            itemProfile(context: context, onTap: (){} , title: "بسته های من"),
            itemProfile(context: context, onTap: (){} , title: "دنبال شونده ها"),

            SizedBox(
              height: 20,
            ),

            itemProfile(context: context, onTap: (){} , title: "افزودن مقاله"),
            itemProfile(context: context, onTap: (){} , title: "افزودن پکیج"),
            itemProfile(context: context, onTap: (){} , title: "مربیان من"),
            itemProfile(context: context, onTap: (){} , title: "باشگاه های من"),
            itemProfile(context: context, onTap: (){} , title: "بررسی qrCode"),
            SizedBox(
              height: 20,
            ),
            itemProfile(context: context, onTap: (){} , title: "پشتیبانی و قوانین"),

          ],
        ),
      ),
    );
  }


  _showQr(String url) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                    width:Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey[800], width: 1)),
                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/QR_deWP.svg/1200px-QR_deWP.svg.png")
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
