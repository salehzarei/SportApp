import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/ProfileFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/addArticle/AddArticlePage.dart';
import 'package:sportapplication/view/page/addPackage/AddPackagePage.dart';
import 'package:sportapplication/view/page/favorite/FavoritePage.dart';
import 'package:sportapplication/view/page/following/FollowPage.dart';
import 'package:sportapplication/view/page/login/LoginPage.dart';
import 'package:sportapplication/view/page/myInfo/MyArticle.dart';
import 'package:sportapplication/view/page/myInfo/MyPackage.dart';
import 'package:sportapplication/view/page/myInfo/MySubSet.dart';
import 'package:sportapplication/view/page/plan/MyBoxPage.dart';
import 'package:sportapplication/view/page/plan/PlanListPage.dart';
import 'package:sportapplication/view/page/profile/profileConstance.dart';
import 'package:sportapplication/view/page/support/SupportPage.dart';

import 'EditeProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Controller bar = Get.put(Controller());
  final ProfileFunction profile = Get.put(ProfileFunction());

  Future scanbarcode() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.bar.barcode.value = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.bar.barcode.value =
              'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.bar.barcode.value = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.bar.barcode.value =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.bar.barcode.value = 'Unknown error: $e');
    }
  }

  @override
  void initState() {
    getShared("token")
        .then((va){
      profile.loadingUserData(tokens: va);
      print(va);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => profile.profileLoading.value
          ? Expanded(
              child: Center(
              child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColorDark,
                size: 30.0,
              ),
            ))
          : Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width,
                    // height: 150,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black26,
                          Colors.black54,
                          Colors.grey[800],
                          // Colors.grey[850]
                        ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 2 / 2,
                                        child: imageShower(
                                            imageUrl:
                                            profile.userProfile.pic,
                                            margin: EdgeInsets.all(6),
                                            fit: BoxFit.fill,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            importImageSelectBottomSheet(
                                                context: context,
                                                title: 'ویرایش پروفایل',
                                                title2: 'انتخاب عکس',
                                                ontap: () {
                                                  Get.to(EditeProfile());
                                                },
                                                ontap2: () {
                                                  importImageSelectBottomSheet(
                                                      context: context,
                                                      title: 'عکس از دوربین',
                                                      title2: 'عکس از گالری');
                                                }),
                                        child: Container(
                                          margin: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          alignment: Alignment.bottomLeft,
                                          child: Transform.translate(
                                            offset: Offset(5.0, -5.0),
                                            child: SvgPicture.asset(
                                              'assets/svg/edit.svg',
                                              width: 20,
                                              height: 20,
                                              color: Colors.red[900],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          profile.userProfile.name,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          profile.userProfile.cell,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "نوع کاربری:",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text(
                                              profile.userProfile.level_title,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
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
                                size: 18, color: Colors.white),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              profile.userProfile.address,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        profile.userProfile.plan.isEmpty? Container(): Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.all_inbox_outlined,
                                    size: 18, color: Colors.white),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "تاریخ اتمام بسته",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              profile.userProfile.plan[0].expire_date,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (notification) {
                      notification.disallowGlow();
                      return false;
                    },
                    child: SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          itemProfile(
                              context: context,
                              onTap: () {
                                Get.to(FavoritePage());
                              },
                              title: "علاقه مندی ها"),
                          itemProfile(
                              context: context,
                              onTap: () {
                                Get.to(PackageListPage());
                              },
                              title: "لیست بسته ها"),
                          itemProfile(
                              context: context,
                              onTap: () {
                                Get.to(MyBoxPage());
                              },
                              title: "بسته های من"),
                          itemProfile(
                              context: context,
                              onTap: () {
                                Get.to(FollowPage());
                              },
                              title: "دنبال کننده ها"),
                          SizedBox(
                            height: 20,
                          ),
                          profile.userProfile.level != 1?Column(
                            children: [
                              itemProfile(
                                  context: context,
                                  onTap: () {
                                    profile.userProfile.provider.active==1? Get.to(AddArticlePage(profile.userProfile.level)):errorSnackBar(text: "شما مجاز به استفاده از این قسمت از اپلیکیشن نیستید");
                                  },
                                  title: "افزودن مقاله"),
                              itemProfile(
                                  context: context,
                                  onTap: () {
                                    Get.to(MyArticle());
                                  },
                                  title: "مقاله های من"),
                              itemProfile(
                                  context: context,
                                  onTap: () {
                                    profile.userProfile.provider.active==1? Get.to(AddPackagePage(profile.userProfile.level)):errorSnackBar(text: "شما مجاز به استفاده از این قسمت از اپلیکیشن نیستید");
                                  },
                                  title: "افزودن پکیج"),
                              itemProfile(
                                  context: context,
                                  onTap: () {
                                    Get.to(MyPackage());
                                  },
                                  title: "پکیج های من"),
                              itemProfile(
                                  context: context,
                                  onTap: () {
                                    Get.to(MySubSet());
                                  },
                                  title: "درخواست ها"),

                              itemProfile(
                                  context: context,
                                  onTap: () {
                                    scanbarcode();
                                  },
                                  title: "بررسی qrCode"),
                            ],
                          ):Container() ,

                          SizedBox(
                            height: 20,
                          ),
                          itemProfile(
                              context: context,
                              onTap: () {
                                Get.to(SupportPage());
                              },
                              title: "پشتیبانی و قوانین"),
                          itemProfile(
                              context: context,
                              onTap: () {
                                // dialogBase(context: context, child: _aboutDeveloper());
                                Get.dialog(_dialogDeveloper(context));
                              },
                              title: "درباره توسعه دهنده"),
                          SizedBox(
                            height: 20,
                          ),
                          itemProfile(
                              context: context,
                              onTap: () {
                                importImageSelectBottomSheet(
                                    context: context,
                                    title: 'خروج از حساب',
                                    title2: 'انصراف',
                                    ontap: () {
                                      saveShared('token', "null").then((value) {
                                        Get.off(LoginPage());
                                      });
                                    },
                                    ontap2: () {
                                      Get.back();
                                    });
                              },
                              title: "خروج از حساب کاربری"),
                        ],
                      ),
                    ),
                  )),
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
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey[800], width: 1)),
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/QR_deWP.svg/1200px-QR_deWP.svg.png")),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _aboutDeveloper() {
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
                child: Column(
                  children: [],
                )),
          ),
        ),
      ],
    );
  }

  _dialogDeveloper(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/image/pish.png'),
                  ),
                  Text(
                    'شرکت پیشگامان دامنه فناوری',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'www.pdf.co.ir',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launchURL('https://pdf.co.ir/');
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    child: Text(
                      "ارتباط با توسعه دهنده",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
