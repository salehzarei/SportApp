import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/Model/ShowPackageModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class PackageFunction extends GetxController {
  final editPackageLoading = false.obs;

  final addPackageLoading = false.obs;
  final addPicLoading = false.obs;

  final picUrl = "0".obs;
  List errorMassages = [];
  int id;

  final showPackageLoading = true.obs;
  ShowPackageModel showPackageModel;

  final userPackageLoading = true.obs;
  MyPackageModel userPackageModel;



  Future<File> imagePicker({@required bool isCamera}) async {
    var pic = await ImagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);

    File croppedFile = await ImageCropper.cropImage(
        sourcePath: pic.path,
        compressFormat: ImageCompressFormat.jpg,
        aspectRatio: CropAspectRatio(ratioX: 800, ratioY: 800),
        maxWidth: 800,
        maxHeight: 600,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: '',
          showCropGrid: false,
          hideBottomControls: true,
        ));

    return croppedFile;

    // if (croppedFile != null) {
    //   checkerror.value == true
    //       ? Get.snackbar(
    //     '',
    //     '',
    //     titleText: Text(''),
    //     messageText: Container(
    //       // height: 300,
    //       child: ListView.builder(
    //           itemCount: errorMassages.length,
    //           physics: NeverScrollableScrollPhysics(),
    //           shrinkWrap: true,
    //           itemBuilder: (context, index) {
    //             return Directionality(
    //               textDirection: TextDirection.rtl,
    //               // child: Text(errorMassages[0]),
    //               child: Html(data: errorMassages[index], style: {
    //                 // tables will have the below background color
    //                 "p": Style(
    //                     fontSize: FontSize.large,
    //                     color: Colors.white,
    //                     height: 2.5),
    //               }
    //                 // onTapUrl: (url) =>
    //                 //     print('tapped $url'),
    //                 // textStyle: TextStyle(
    //                 //     color: Colors.white,
    //                 //     // letterSpacing: 10,
    //                 //     // textBaseline: TextBaseline.alphabetic,
    //                 //     height: 2.5,
    //                 //     fontSize: 18),
    //               ),
    //             );
    //             // return Text(
    //             //   register.errorMassages[index],
    //             //   textDirection: TextDirection.rtl,
    //             //   style: TextStyle(
    //             //       color: Colors.white, fontSize: 18),
    //             // );
    //           }),
    //     ),
    //     backgroundColor:
    //     checkerror.value == false ? Colors.green : Colors.red,
    //     colorText: Colors.white,
    //     icon: Icon(
    //       Icons.error,
    //       color: Colors.white,
    //       size: 40,
    //     ),
    //   )
    //       : sendAddProductPic(croppedFile).whenComplete(() {
    //     uploadUrlPic.add(uploadpicurl.value);
    //     uploadProductPicName.add(uploadpic.value);
    //     // print('uploadUrlPic         Listtttt');
    //     // print(uploadUrlPic);
    //     // print('upload Product Pic Name         Listtttt');
    //     // print(uploadProductPicName);
    //   });
    // }
  }

  Future<int> uploadImage({@required String token, @required File pic}) async {
    addPicLoading.value = true;
    errorMassages.clear();

    final response =
        await ApiService().uploadProductPic(token: token, pic: pic);

    print('uploadImage');

    if (response.statusCode == 200) {
      bool err = response.body['error'];
      if (!err) {
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];

        picUrl(response.body['file'].toString());
        addPicLoading.value = false;
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        addPicLoading.value = false;
        return 201;
      }
    } else {
      addPicLoading.value = false;
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

  Future<int> addPackage(
      {@required String token,
      @required String title,
      @required String description,
      @required String category,
      @required List pics,
      @required String price,
      @required String discount,
      @required String discount_type,
      @required String sdate,
      @required String edate}) async {
    addPackageLoading.value = true;
    errorMassages.clear();

    final response = await ApiService().addPackage(
        discount: discount,
        sdate: sdate,
        token: token,
        pics: pics,
        edate: edate,
        title: title,
        discount_type: discount_type,
        category: category,
        description: description,
        price: price);

    if (response.statusCode == 200) {
      addPackageLoading.value = response.body['error'];
      if (!addPackageLoading.value) {
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }


  Future<int> editPackage(
      {@required String token,
      @required String proId,
      @required String title,
      @required String description,
      @required String category,
      @required List pics,
      @required String price,
      @required String discount,
      @required String discount_type,
      @required String sdate,
      @required String edate}) async {

    editPackageLoading.value = true;
    errorMassages.clear();

    final response = await ApiService().editPackage(
        discount: discount,
        sdate: sdate,
        token: token,
        pics: pics,
        edate: edate,
        title: title,
        discount_type: discount_type,
        category: category,
        description: description,
        price: price,
        proId: proId);

    if (response.statusCode == 200) {
      editPackageLoading.value = response.body['error'];
      if (!editPackageLoading.value) {
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }

  }

  Future addFavorite({@required String token, @required String proId}) async {
    errorMassages.clear();
    final response = await ApiService().addFavPackage(
      token: token,
      proId: proId,
    );

    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if (!error) {
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        id = response.body['id'];
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    update();
  }

  Future checkpackage({@required String token, @required String code}) async {
    errorMassages.clear();
    final response = await ApiService().checkpackage(
      token,
      code,
    );

    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if (!error) {
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        id = response.body['id'];
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    update();
  }

  Future removeFav({@required String token, @required String proId}) async {
    errorMassages.clear();
    final response = await ApiService().removeFavPackage(
      token: token,
      proId: proId,
    );

    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if (!error) {
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    update();
  }

  Future<List<MyPackagePost>> getMyPackageList({@required String token}) async {
    final response = await ApiService().getMyPackage(token: token);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body['post'];
      List<MyPackagePost> pln =
          (responseData).map((i) => MyPackagePost.fromJson(i)).toList();
      return pln;
    } else {
      return [];
    }
  }

  Future geUserPackageList(
      {@required String token,
      @required String catId,
      @required String word,
      @required String uid,
      @required String sort,
      @required String order,
      @required String limit,
      @required String interest,
      @required String level,
      @required String page,
      @required String special,
      @required String folowing,
      @required String favorite,
      @required String asc}) async {
    userPackageLoading.value = true;
    final response = await ApiService().getPackage(
        token: token,
        word: word,
        catId: catId,
        interest: interest,
        uid: uid,
        folowing: folowing,
        order: order,
        sort: sort,
        special: special,
        level: level,
        asc: asc,
        favorite: favorite,
        limit: limit,
        page: page);
    if (response.statusCode == 200) {
      print('response.body');
      print(response.body);
      userPackageLoading.value = false;
      userPackageModel = MyPackageModel.fromJson(response.body);
      print(userPackageModel.post.length);
    } else {
      userPackageLoading.value = true;
    }
    update();
  }

  Future<int> removePackage(String token, String pId) async {
    final response = await ApiService().removePackage(token, pId);
    if (response.statusCode == 200) {
      addPackageLoading.value = response.body['error'];
      if (!addPackageLoading.value) {
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      } else {
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

  Future showPackage(String token, String pId) async {
    showPackageLoading.value = true;
    final response = await ApiService().showPackage(token, pId);
    print("response.statusCode");
    print(response.statusCode);

    if (response.statusCode == 200) {
      showPackageLoading.value = false;
      showPackageModel = ShowPackageModel.fromJson(response.body);
    }
    update();
  }

  Future showUserPackage(String token, String pId) async {
    final response = await ApiService().showUserPackage(token, pId);

    if (response.statusCode == 200) {
      print('response.body');
      print(response.body);
      showPackageLoading.value = false;
      showPackageModel = ShowPackageModel.fromJson(response.body);
    } else {
      showPackageLoading.value = false;
    }
    update();
  }
}
