import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class AddPackageFunction extends GetxController {
  final addPackageLoading = false.obs;
  final addPicLoading = false.obs;
  final picUrl = "0".obs;
  List errorMassages = [];

  Future<File> imagePicker({@required bool isCamera}) async {
    var pic = await ImagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);

    File croppedFile = await ImageCropper.cropImage(
        sourcePath: pic.path,
        compressFormat: ImageCompressFormat.jpg,
        aspectRatio: CropAspectRatio(ratioX: 800, ratioY: 800),
        maxWidth: 800,
        maxHeight: 800,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: '',
          showCropGrid: false,
          hideBottomControls: true,
        ));

    print('croppedFile');
    print(croppedFile);

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

  //////اد کردن پکیج توسط کاربران مجاز
  Future<int> uploadImage(
      {@required String token,
      @required File pic}) async {

    addPicLoading.value = true;
    errorMassages.clear();

    final response = await ApiService().uploadProductPic(
        token: token,
        pic: pic);

    print('uploadImage');

    if (response.statusCode == 200) {
      bool err = response.body['error'];
      if(!err){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];

        picUrl(response.body['file'].toString());
        addPicLoading.value = false;
        return 200;
      }else{
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


  //////اد کردن پکیج توسط کاربران مجاز
  Future<int> addPackage(
      {@required String token,
        @required String title,
        @required String description,
        @required String category,
        @required List<String> pics,
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
        discount_type:discount_type,
        category: category,
        description: description,
        price: price);
    print("response");
    print(response.statusCode);
    if (response.statusCode == 200) {
      addPackageLoading.value = response.body['error'];
      if(!addPackageLoading.value){
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
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
}
