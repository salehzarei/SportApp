import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

class EditProviderPackage extends StatefulWidget {

  String id;

  EditProviderPackage(this.id);

  @override
  _EditProviderPackageState createState() => _EditProviderPackageState();
}

class _EditProviderPackageState extends State<EditProviderPackage> {

  final RegisterFunction registerFunction = Get.put(RegisterFunction());
  final PackageFunction addPackage = Get.put(PackageFunction());

  FocusNode _titleFocus;
  TextEditingController _titleController;

  FocusNode _desFocus;
  TextEditingController _desController;

  FocusNode _priceFocus;
  TextEditingController _priceController;

  FocusNode _discountFocus;
  TextEditingController _discountController;

  String _token = "0";

  int _selectImage = 0;
  bool _loadToSend = false;

  String url = 'https://sportapp.pdf.co.ir/files/package/';
  // String url = 'http://192.168.1.3/np-framework/sportplus/files/package/';

  List _bool=[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List _title = [
    'تاریخ شروع',
    'تاریخ پایان',
  ];
  List _imageUrl = [];

  File fileOne;
  File fileTow;
  File fileTree;
  File fileFour;
  File fileFive;
  File fileSix;

  @override
  void initState() {
    getShared('token').then((value){
      _token = value;
      addPackage.showPackage(value,widget.id).whenComplete(() {
        if(mounted){
          setState(() {
            if(!addPackage.showPackageLoading.value){

              _titleController.text = addPackage.showPackageModel.data.title;
              _desController.text = addPackage.showPackageModel.data.description;

              _priceController.text = addPackage.showPackageModel.data.price.toString();

              if( addPackage.showPackageModel.data.discount != 0){
                _discountController.text = addPackage.showPackageModel.data.discount.toString();
                _title[0] = addPackage.showPackageModel.data.sdate;
                _title[1] = addPackage.showPackageModel.data.edate;
                _bool[6] = true;
                if( addPackage.showPackageModel.data.discount_type == 2){
                  _bool[7] = true;
                }
              }

              addPackage.showPackageModel.data.gallery.forEach((element) {
                _imageUrl.add(element.pic_name);
              });

            }
          });
        }
      });
    });

    _initView();
    super.initState();
  }

  @override
  void dispose() {
    _disposeView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          elevation: 2,
          brightness: Brightness.dark,
          title: Text("ویرایش پکیج",
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
            child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 15 ),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return false;
                  },
                  child: addPackage.showPackageLoading.value?loading(color: Theme.of(context).primaryColorDark): SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric( vertical: 12),
                            child: Row(
                              children: [
                                Text("دسته بندی:" ,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                SizedBox(
                                  width: 8,),
                                Text(addPackage.showPackageModel.data.category_title ,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600]
                                  ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only( top: 12 , bottom: 15),
                            child: Text("عکس محصول:" ,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: addPackage.showPackageModel.data.gallery.length >0 ?
                                itemImageloaded(
                                    context: context,
                                    onTap: (){
                                      // _importImageSelectBottomSheetA(context,1);
                                    },
                                    loaded: _bool[0],
                                    imageUri:url+_imageUrl[0],
                                    title: "افزودن عکس",
                                    onPressed: (){
                                      Get.dialog(_showImageUrl(url+_imageUrl[0]));
                                    }, onDelPressed:(){
                                  _importImageSelectBottomSheetA(context,1);
                                }) :
                                itemImageAdd(
                                    context: context,
                                    onTap: (){
                                      _importImageSelectBottomSheet(context,1);
                                    },
                                    loaded: _bool[0],
                                    imageUri: fileOne,
                                    title: "افزودن عکس",
                                    imageSelected: _selectImage,
                                    onPressed: (){
                                      Get.dialog(_showImage(fileOne));
                                    }),
                              ),
                              SizedBox(
                                width: 6,),
                              Expanded(
                                flex:1,
                                child:addPackage.showPackageModel.data.gallery.length >1 ?
                                itemImageloaded(
                                    context: context,
                                    onTap: (){
                                      // _importImageSelectBottomSheet(context,2);
                                    },
                                    loaded: _bool[1],
                                    imageUri:url+ _imageUrl[1],
                                    title: "افزودن عکس",
                                    onPressed: (){
                                      Get.dialog(_showImageUrl(url+_imageUrl[1]));
                                    },  onDelPressed:(){
                                  _importImageSelectBottomSheetA(context,2);
                                })
                                    :itemImageAdd(
                                    context: context,
                                    onTap: (){
                                      _importImageSelectBottomSheet(context, 2);
                                    },
                                    loaded: _bool[1],
                                    imageUri: fileTow,
                                    title: "افزودن عکس",
                                    imageSelected: _selectImage,
                                    onPressed: (){
                                      Get.dialog(_showImage(fileTow));
                                    }),
                              ),
                              SizedBox(
                                width: 6,),
                              Expanded(
                                flex:1,
                                child: addPackage.showPackageModel.data.gallery.length >2 ?
                                itemImageloaded(
                                    context: context,
                                    onTap: (){
                                      // _importImageSelectBottomSheetA(context,3);
                                    },
                                    loaded: _bool[2],
                                    imageUri:url+ _imageUrl[2],
                                    title: "افزودن عکس",
                                    onDelPressed:(){
                                      _importImageSelectBottomSheetA(context,3);
                                    },
                                    onPressed: (){
                                      Get.dialog(_showImageUrl(url+_imageUrl[2]));
                                    }) :
                                itemImageAdd(
                                    context: context,
                                    onTap: (){
                                      _importImageSelectBottomSheet(context,3);
                                    },
                                    loaded: _bool[2],
                                    imageUri: fileTree,
                                    title: "افزودن عکس",
                                    imageSelected: _selectImage,
                                    onPressed: (){
                                      Get.dialog(_showImage(fileTree));
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: addPackage.showPackageModel.data.gallery.length >3 ?
                                itemImageloaded(
                                    context: context,
                                    onTap: (){
                                      // _importImageSelectBottomSheetA(context,4);
                                    },
                                    onDelPressed:(){
                                      _importImageSelectBottomSheetA(context,4);
                                    },
                                    loaded: _bool[3],
                                    imageUri:url+_imageUrl[3],
                                    title: "افزودن عکس",
                                    onPressed: (){
                                      Get.dialog(_showImageUrl(url+_imageUrl[3]));
                                    }) :
                                itemImageAdd(
                                    context: context,
                                    onTap: (){
                                      _importImageSelectBottomSheet(context,4);
                                    },
                                    loaded: _bool[3],
                                    imageUri: fileFour,
                                    title: "افزودن عکس",
                                    imageSelected: _selectImage,
                                    onPressed: (){
                                      Get.dialog(_showImage(fileFour));
                                    }),
                              ),
                              SizedBox(
                                width: 6,),
                              Expanded(
                                flex:1,
                                child:addPackage.showPackageModel.data.gallery.length >4 ?
                                itemImageloaded(
                                    context: context,
                                    onTap: (){
                                      // _importImageSelectBottomSheetA(context,5);
                                    },
                                    onDelPressed:(){
                                      _importImageSelectBottomSheetA(context,5);
                                    },
                                    loaded: _bool[4],
                                    imageUri:url+_imageUrl[4],
                                    title: "افزودن عکس",
                                    onPressed: (){
                                      Get.dialog(_showImageUrl(url+_imageUrl[4]));
                                    }) :
                                itemImageAdd(
                                    context: context,
                                    onTap: (){
                                      _importImageSelectBottomSheet(context,5);
                                    },
                                    loaded: _bool[4],
                                    imageUri: fileFive,
                                    title: "افزودن عکس",
                                    imageSelected: _selectImage,
                                    onPressed: (){
                                      Get.dialog(_showImage(fileFive));
                                    }),
                              ),
                              SizedBox(
                                width: 6,),
                              Expanded(
                                flex:1,
                                child: addPackage.showPackageModel.data.gallery.length >5 ?
                                itemImageloaded(
                                    context: context,
                                    onTap: (){
                                      // _importImageSelectBottomSheetA(context,6);
                                    },
                                    onDelPressed:(){
                                      _importImageSelectBottomSheetA(context,6);
                                    },
                                    loaded: _bool[5],
                                    imageUri:url+_imageUrl[5],
                                    title: "افزودن عکس",
                                    onPressed: (){
                                      Get.dialog(_showImageUrl(url+_imageUrl[5]));
                                    }) :
                                itemImageAdd(
                                    context: context,
                                    onTap: (){
                                      _importImageSelectBottomSheet(context,6);
                                    },
                                    loaded: _bool[5],
                                    imageUri: fileSix,
                                    title: "افزودن عکس",
                                    imageSelected: _selectImage,
                                    onPressed: (){
                                      Get.dialog(_showImage(fileSix));
                                    }),

                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only( top: 30 , bottom: 15),
                            child: Text("عنوان محصول:" ,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                          ),
                          textFormFieldHintWidget(
                              context: context,
                              focus: _titleFocus,
                              controller: _titleController,
                              hint: " ",
                              maxLine: 1,
                              minLine: 1,
                              keyboardType: TextInputType.text,
                              maxLength: 1000),
                          Padding(
                            padding:  EdgeInsets.only( top: 30 , bottom: 15),
                            child: Text("توضیحات محصول:" ,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                          ),
                          textFormFieldHintWidget(
                              context: context,
                              focus: _desFocus,
                              controller: _desController,
                              hint: " ",
                              maxLine: 5,
                              minLine: 1,
                              keyboardType: TextInputType.multiline,
                              maxLength: 1000),
                          Padding(
                            padding:  EdgeInsets.only( top: 30 , bottom: 15),
                            child: Text("قیمت گذاری:" ,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                Text("قیمت به تومان:" ,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                Expanded(
                                    child:Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: textFormFieldHintWidget(
                                          context: context,
                                          focus: _priceFocus,
                                          controller: _priceController,
                                          hint: " ",
                                          maxLine: 1,
                                          minLine: 1,
                                          keyboardType: TextInputType.number,
                                          maxLength: 7),
                                    )
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: InkWell(
                                    onTap: () {
                                      if(!_bool[6]){

                                      }else{

                                      }
                                      setState(() {
                                        _bool[6] = !_bool[6];
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(8),
                                    child: checkBoxItem(
                                        context: context,
                                        clicked: _bool[6],
                                        title: "تخفیف؟",
                                        onChanged: (bool value) {
                                          setState(() {
                                            _bool[6] = !_bool[6];
                                          });
                                        }),
                                  ),
                                ),
                                _bool[6] ? Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: InkWell(
                                    onTap: () {
                                      if(!_bool[7]){

                                      }else{

                                      }
                                      setState(() {
                                        _bool[7] = !_bool[7];
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(8),
                                    child: checkBoxItem(
                                        context: context,
                                        clicked: _bool[7],
                                        title: "نوع تخفیف درصدی؟",
                                        onChanged: (bool value) {
                                          setState(() {
                                            _bool[7] = !_bool[7];
                                          });
                                        }),
                                  ),
                                ):Container(),

                              ],
                            ),
                          ),
                          _bool[6] ?Padding(
                            padding:EdgeInsets.only(left: 15 , right: 15 , bottom: 20),
                            child: Row(
                              children: [
                                Text(
                                  _bool[7] ?"میزان تخفیف بر حسب درصد:":"میزان تخفیف بر حسب تومان:" ,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                SizedBox(width: 15,),
                                Expanded(
                                    child:textFormFieldHintWidget(
                                        context: context,
                                        focus: _discountFocus,
                                        controller: _discountController,
                                        hint: " ",
                                        maxLine: 1,
                                        minLine: 1,
                                        keyboardType: TextInputType.number,
                                        maxLength: _bool[7] ?2:7)
                                ),
                              ],
                            ),
                          ):Container(),
                          _bool[6] ?Container(
                            padding:EdgeInsets.only(right: 15 , left: 15 ,bottom: 15),
                            child:  textSelected(
                                context: context,
                                title: _title[0],
                                bool: _bool[8],
                                tapFunction: () {
                                  _showDialogDateTime().then((value){
                                    if(mounted){
                                      setState(() {
                                        _title[0] = value;
                                      });
                                    }
                                  });
                                },
                                hoverFunction: (value) {

                                },
                                widthSize: Get.width,
                                selected: _title[0] == "تاریخ شروع"
                                    ? false
                                    : true),
                          ):Container(),
                          _bool[6] ?Container(
                            padding:EdgeInsets.only(right: 15 , left: 15 ,bottom: 15),
                            child:  textSelected(
                                context: context,
                                title: _title[1],
                                bool: _bool[9],
                                tapFunction: () {
                                  _showDialogDateTime().then((value){
                                    if(mounted){
                                      setState(() {
                                        _title[1] = value;
                                      });
                                    }
                                  });
                                },
                                hoverFunction: (value) {

                                },
                                widthSize: Get.width,
                                selected: _title[1] == "تاریخ پایان"
                                    ? false
                                    : true),
                          ):Container(),
                          Container(
                            padding:EdgeInsets.only(right: 15 , left: 15 ,bottom: 15),
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () {
                                if(_titleController.text.isEmpty){
                                  if(mounted){
                                    setState(() {
                                      errorSnackBar(text: "نام محصول را وارد نمایید", error: true,context: context);
                                    });
                                  }
                                  return;
                                }
                                if(_desController.text.isEmpty){
                                  if(mounted){
                                    setState(() {
                                      errorSnackBar(text: "توضیح محصول را وارد نمایید", error: true,context: context);
                                    });
                                  }
                                  return;
                                }
                                if(_priceController.text.isEmpty){
                                  if(mounted){
                                    setState(() {
                                      errorSnackBar(text: "قیمت محصول را وارد نمایید", error: true,context: context);
                                    });
                                  }
                                  return;
                                }
                                if(_bool[6]){
                                  if(_title[0] == "تاریخ شروع"){
                                    if(mounted){
                                      setState(() {
                                        errorSnackBar(text: "تاریخ شروع را وارد نمایید", error: true,context: context);
                                      });
                                    }
                                    return;
                                  }
                                  if(_title[1] == "تاریخ پایان"){
                                    if(mounted){
                                      setState(() {
                                        errorSnackBar(text: "تاریخ پایان را وارد نمایید", error: true,context: context);
                                      });
                                    }
                                    return;
                                  }
                                  if(_discountController.text.isEmpty){
                                    if(mounted){
                                      setState(() {
                                        errorSnackBar(text: "تخفیف را وارد نمایید", error: true,context: context);
                                      });
                                    }
                                    return;
                                  }
                                }
                                if(_imageUrl.isEmpty){
                                  if(mounted){
                                    setState(() {
                                      errorSnackBar(text: "عکس وارد نشده", error: true,context: context);
                                    });
                                  }
                                  return;
                                }
                                if(mounted){
                                  setState(() {
                                    _loadToSend = true;
                                  });
                                }
                                addPackage.editPackage(
                                    token: _token,
                                    title: _titleController.text,
                                    description: _desController.text,
                                    category: addPackage.showPackageModel.data.category.toString(),
                                    pics: _imageUrl,
                                    price:_priceController.text,
                                    discount: _bool[6]?_discountController.text:"0",
                                    discount_type:_bool[6]? _bool[7]?"2":"1":" ",
                                    sdate: _bool[6]? _title[0]:" ",
                                    edate: _bool[6]?  _title[1]:" ",
                                    proId: widget.id).then((value){
                                  if(value == 200){
                                    if(mounted){
                                      setState(() {
                                        _loadToSend = false;
                                      });
                                    }
                                    listSnackBar(list: addPackage.errorMassages, err: false,);
                                  }else{
                                    if(mounted){
                                      setState(() {
                                        _loadToSend = false;
                                      });
                                    }
                                    listSnackBar(list: addPackage.errorMassages, err: true,);
                                  }
                                });
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
                              child: _loadToSend ? Center(
                                child: SpinKitThreeBounce(
                                  color: Theme.of(context).primaryColorDark,
                                  size: 25.0,
                                ),
                              ):Text(
                                "ویرایش و ارسال",
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      )),
                )))));
  }

  _importImageSelectBottomSheet(BuildContext context,int from) {
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
                                onTap: (){
                                  addPackage.imagePicker(isCamera: true).then((value) {
                                    addPackage.uploadImage(token: _token, pic: value).then((uploadStatus) {
                                      if(uploadStatus == 200){
                                        if(mounted){
                                          setState(() {
                                            switch(from){
                                              case 1:
                                                fileOne = value;
                                                _bool[0] = true;
                                                _imageUrl.add(addPackage.picUrl.value);
                                                break;
                                              case 2:
                                                fileTow = value;
                                                _bool[1] = true;
                                                _imageUrl.add(addPackage.picUrl.value);
                                                break;
                                              case 3:
                                                fileTree = value;
                                                _bool[2] = true;
                                                _imageUrl.add(addPackage.picUrl.value);
                                                break;
                                              case 4:
                                                fileFour = value;
                                                _bool[3] = true;
                                                _imageUrl.add(addPackage.picUrl.value);
                                                break;
                                              case 5:
                                                fileFive = value;
                                                _bool[4] = true;
                                                _imageUrl.add(addPackage.picUrl.value);
                                                break;
                                              case 6:
                                                fileSix = value;
                                                _bool[5] = true;
                                                _imageUrl.add(addPackage.picUrl.value);
                                                break;
                                            }
                                          });
                                        }
                                        _selectImage = 1;
                                        Get.back();
                                        listSnackBar(list: addPackage.errorMassages, err: false,);
                                      }else{
                                        listSnackBar(list: addPackage.errorMassages, err: true,);
                                      }
                                    });
                                  });
                                }),
                            ListTile(
                              leading: Icon(Icons.photo_library,
                                  color: Colors.white),
                              title: Text(
                                'عکس از گالری',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: (){
                                addPackage.imagePicker(isCamera: false).then((value) {
                                  addPackage.uploadImage(token: _token, pic: value).then((uploadStatus) {
                                    if(uploadStatus == 200){
                                      if(mounted){
                                        setState(() {
                                          switch(from){
                                            case 1:
                                              fileOne = value;
                                              _bool[0] = true;
                                              _imageUrl.add(addPackage.picUrl.value);
                                              break;
                                            case 2:
                                              fileTow = value;
                                              _bool[1] = true;
                                              _imageUrl.add(addPackage.picUrl.value);
                                              break;
                                            case 3:
                                              fileTree = value;
                                              _bool[2] = true;
                                              _imageUrl.add(addPackage.picUrl.value);
                                              break;
                                            case 4:
                                              fileFour = value;
                                              _bool[3] = true;
                                              _imageUrl.add(addPackage.picUrl.value);
                                              break;
                                            case 5:
                                              fileFive = value;
                                              _bool[4] = true;
                                              _imageUrl.add(addPackage.picUrl.value);
                                              break;
                                            case 6:
                                              fileSix = value;
                                              _bool[5] = true;
                                              _imageUrl.add(addPackage.picUrl.value);
                                              break;
                                          }
                                        });
                                      }
                                      _selectImage = 1;
                                      Get.back();
                                      listSnackBar(list: addPackage.errorMassages, err: false,);
                                    }else{
                                      listSnackBar(list: addPackage.errorMassages, err: true,);
                                    }

                                  });
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

  _importImageSelectBottomSheetA(BuildContext context,int from) {
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
                          'عکس مورد نظر حذف شود؟',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Container(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                                leading: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  'بله',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: (){
                                  if(mounted){
                                    setState(() {
                                      switch(from){
                                        case 1:
                                          _imageUrl.remove(_imageUrl[0]);
                                          addPackage.showPackageModel.data.gallery.remove(addPackage.showPackageModel.data.gallery[0]);
                                          break;
                                        case 2:
                                          _imageUrl.remove(_imageUrl[1]);
                                          addPackage.showPackageModel.data.gallery.remove(addPackage.showPackageModel.data.gallery[1]);
                                          break;
                                        case 3:
                                          _imageUrl.remove(_imageUrl[2]);
                                          addPackage.showPackageModel.data.gallery.remove(addPackage.showPackageModel.data.gallery[2]);
                                          break;
                                        case 4:
                                          _imageUrl.remove(_imageUrl[3]);
                                          addPackage.showPackageModel.data.gallery.remove(addPackage.showPackageModel.data.gallery[3]);
                                          break;
                                        case 5:
                                          _imageUrl.remove(_imageUrl[4]);
                                          addPackage.showPackageModel.data.gallery.remove(addPackage.showPackageModel.data.gallery[4]);
                                          break;
                                        case 6:
                                          _imageUrl.remove(_imageUrl[5]);
                                          addPackage.showPackageModel.data.gallery.remove(addPackage.showPackageModel.data.gallery[5]);
                                          break;
                                      }
                                    });
                                  }
                                  Get.back();
                                }),
                            ListTile(
                              leading: Icon(Icons.close,
                                  color: Colors.white),
                              title: Text(
                                'انصراف',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: (){
                                Get.back();
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

  _showImage(File image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 4/3,
              child: Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: FileImage(image), fit: BoxFit.fill)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          colors: [
                            Colors.white.withOpacity(.3),
                            Colors.white.withOpacity(.001),
                            Colors.white.withOpacity(.00001),
                          ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  _showImageUrl(String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 4/3,
              child: Container(
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          colors: [
                            Colors.white.withOpacity(.3),
                            Colors.white.withOpacity(.001),
                            Colors.white.withOpacity(.00001),
                          ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  _initView() {
    _titleFocus = FocusNode();
    _desFocus = FocusNode();
    _priceFocus = FocusNode();
    _discountFocus = FocusNode();

    _titleController = TextEditingController();
    _desController = TextEditingController();
    _priceController = TextEditingController();
    _discountController = TextEditingController();
  }

  _disposeView(){
    _titleFocus .dispose();
    _desFocus .dispose();
    _priceFocus .dispose();
    _discountFocus .dispose();
    _discountController .dispose();
    _titleController.dispose();
    _desController.dispose();
    _priceController.dispose();
  }

  Future<String> _showDialogDateTime() async{
    Jalali picked = await showPersianDatePicker(

      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1385, 8),
      lastDate: Jalali(1450, 9),
    );

    return picked.formatCompactDate();
  }

}
