import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/GalleryFunction.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/gallery/GalleryConstant.dart';
import 'package:sportapplication/view/page/profile/profileConstance.dart';

class MyGalleryPage extends StatefulWidget {
  const MyGalleryPage({Key key}) : super(key: key);

  @override
  _MyGalleryPageState createState() => _MyGalleryPageState();
}

class _MyGalleryPageState extends State<MyGalleryPage> {
  final GalleryFunction _galleryFunction = Get.put(GalleryFunction());
  final PackageFunction _addPackage = Get.put(PackageFunction());


  FocusNode _titleFocus;
  TextEditingController _titleController;


  String _token;
  bool _loaded = false;
  int _selectImage = 0;
  File imageF;
  bool sendGallery = false;

  @override
  void initState() {
    _titleController = TextEditingController();
    _titleFocus = FocusNode();
    getShared('token').then((tok) {
      _token = tok;
      _galleryFunction.getMyGallery(token: tok);
    });
    super.initState();
  }

  @override
  void dispose() {

    _titleController .dispose();
    _titleFocus .dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 2,
            brightness: Brightness.dark,
            title: Text("گالری من",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            leading: IconButton(
                color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Get.back();
                }),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  _galleryFunction.showMyGalleryLoading.value
                      ? loading(color: Theme.of(context).primaryColorDark)
                      : _galleryFunction.showGalleryModel.post.isEmpty
                          ? noItem()
                          : ListView.builder(
                              itemCount:
                                  _galleryFunction.showGalleryModel.post.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              itemBuilder: (context, index) => itemGallery(
                                  data: _galleryFunction
                                      .showGalleryModel.post[index],
                                  showClick: () {
                                    Get.dialog(_showQr(_galleryFunction
                                        .showGalleryModel.post[index].pic));
                                  },
                                  removeGallery: () {
                                    importImageSelectBottomSheet(
                                        context: context,
                                        title: 'حذف عکس از گالری',
                                        title2: 'انصراف',
                                        ontap: () {
                                          _galleryFunction
                                              .removeGallery(
                                                  token: _token,
                                                  proId: _galleryFunction
                                                      .showGalleryModel
                                                      .post[index]
                                                      .id
                                                      .toString())
                                              .then((value) {
                                            if (value == 200) {
                                              Get.back();
                                              _galleryFunction.getMyGallery(
                                                  token: _token);
                                              listSnackBar(
                                                list: _galleryFunction
                                                    .errorMassages,
                                                err: false,
                                              );
                                            } else {
                                              listSnackBar(
                                                list: _galleryFunction
                                                    .errorMassages,
                                                err: true,
                                              );
                                            }
                                          });
                                        },
                                        ontap2: () {
                                          Get.back();
                                        });
                                  }),
                            ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        onPressed: () {
                          _loaded = false;
                          _selectImage = 0;
                          sendGallery = false;
                          _titleController.text='';
                          Get.dialog(_dialogAddImage());
                          },
                        child: Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
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
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4/3,
                    child: imageShower(
                        imageUrl: url,
                        margin: EdgeInsets.all(0),
                        fit: BoxFit.fill,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(colors: [
                                  Colors.black26,
                                  Colors.grey[800],
                                ])),
                            margin: EdgeInsets.only(top: 6, right: 6),
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _dialogAddImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: StatefulBuilder(
              builder: (context, addImageSetState) => Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        color: Colors.red,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.close ,color: Colors.white,),
                              ),
                            ),
                            Text("افزودن به گالری",style: TextStyle(
                              color: Colors.white,
                              fontSize: 13
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: AspectRatio(
                            aspectRatio: 4/3,
                            child: _itemImageAdd(
                              context: context,
                              onTap: () {
                                _importImageSelectBottomSheet(
                                    context, addImageSetState);
                              },
                              loaded: _loaded,
                              imageUri: imageF,
                              title: "افزودن عکس",
                              imageSelected: _selectImage,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child:textFormFieldHintWidget(
                          context: context,
                          focus: _titleFocus,
                          controller: _titleController,
                          hint: "عنوان عکس را وارد کنید",
                          maxLine: 1,
                          minLine: 1,
                          keyboardType: TextInputType.text,
                          maxLength: 1000),),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if(!sendGallery){
                              if(_titleController.text.isEmpty){
                                errorSnackBar(text: "عنوان عکس را باید وارد کنید", error: true, context: context);
                                return;
                              }
                              if(mounted){
                                addImageSetState(() {
                                  sendGallery = true;
                                });
                                _sendToGallery();
                              }
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              ),
                              backgroundColor:MaterialStateProperty.all<Color>(Colors.white)),
                          child: sendGallery? loading(color: Colors.red):Text(
                            "تایید و ارسال",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  _itemImageAdd(
      {@required context,
      @required onTap,
      @required loaded,
      @required imageUri,
      @required title,
      @required imageSelected}) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        dashPattern: [4, 2],
        strokeWidth: 1,
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        padding: EdgeInsets.all(4),
        child: AspectRatio(
          aspectRatio: 4/3,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.grey[300],
                      width: 1)),
              child: loaded
                  ? imageSelected == 1
                      ? Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey[300], width: 1)),
                          child: ClipRRect(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: FileImage(imageUri),
                                fit: BoxFit.fill,
                              )),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ))
                      : Center(
                          child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  backgroundColor: Colors.white)))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.grey[800],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }

  _importImageSelectBottomSheet(BuildContext context, addImageSetState) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (BuildContext bc) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: 220,
              padding: EdgeInsets.all(15),
              // color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey))),
                        child: Text(
                          'انتخاب عکس',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Container(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                                leading: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'عکس با دوربین',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  _addPackage
                                      .imagePicker(isCamera: true)
                                      .then((value) {
                                    if (mounted) {
                                      Get.back();
                                      addImageSetState(() {
                                        imageF = value;
                                        _loaded = true;
                                        _selectImage = 1;
                                      });
                                    }
                                  });
                                }),
                            ListTile(
                              leading: Icon(Icons.photo_library,
                                  color: Colors.white),
                              title: Text(
                                'عکس از گالری',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                _addPackage
                                    .imagePicker(isCamera: false)
                                    .then((value) {
                                  if (mounted) {
                                    Get.back();
                                    addImageSetState(() {
                                      imageF = value;
                                      _loaded = true;
                                      _selectImage = 1;
                                    });
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  _sendToGallery() {
    _galleryFunction.addGallery(token: _token, title: _titleController.text, pic: imageF).then((value) {
      if(value == 200){
        Get.back();
        _galleryFunction.getMyGallery(token: _token);
        listSnackBar(list: _galleryFunction.errorMassages, err: false);
      }else{
        listSnackBar(list: _galleryFunction.errorMassages, err: true);
      }
    });
  }

}
