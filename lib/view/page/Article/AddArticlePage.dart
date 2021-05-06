import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

class AddArticlePage extends StatefulWidget {
  int level_provider;

  AddArticlePage(this.level_provider);

  @override
  _AddAtrticlePageState createState() => _AddAtrticlePageState();
}

class _AddAtrticlePageState extends State<AddArticlePage> {

  final RegisterFunction registerFunction = Get.put(RegisterFunction());
  final PackageFunction addPackage = Get.put(PackageFunction());
  final ArticleFunction articleFunction = Get.put(ArticleFunction());

  FocusNode _titleFocus;
  TextEditingController _titleController;

  FocusNode _desFocus;
  TextEditingController _desController;

  FocusNode _summaryFocus;
  TextEditingController _summaryController;

  FocusNode _tagFocus;
  TextEditingController _tagController;


  int _step = 0;
  int _idCat = 0;
  String _titleCat = "0";

  int _selectImage = 0;
  bool _loadToSend = false;

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

  String _token;
  List _imageUrl = [];
  List<String> _values = [];

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
      registerFunction.getProductCategories(widget.level_provider);
    });
    _initView();
    super.initState();
  }

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
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
          title: Text("افزودن مقاله",
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
        body: _step == 0
            ? Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
                child: Text(
                  "انتخاب دسته بندی",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[500],
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              ),
              Expanded(
                  child: registerFunction.categoryLoading.value
                      ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                            size: 30.0,
                        ),
                      ): ListView.builder(
                    shrinkWrap: true,
                    itemCount: registerFunction.categoryList.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                _idCat = registerFunction
                                    .categoryList[index].id;
                                _titleCat = registerFunction
                                    .categoryList[index].title;
                                _step = 1;
                              });
                            }
                          },
                          child: Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Text(
                              registerFunction
                                  .categoryList[index].title,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          margin:
                          EdgeInsets.symmetric(horizontal: 30),
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        )
            : Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              padding:  EdgeInsets.symmetric(horizontal: 15 ),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return false;
                },
                child: SingleChildScrollView(
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
                            InkWell(
                              onTap: () {
                                if(mounted){
                                  setState(() {
                                    _step = 0;
                                  });
                                }
                              },
                              child: Text(_titleCat ,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600]
                                ),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only( top: 12 , bottom: 15),
                        child: Text("عکس مقاله:" ,
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
                            child:itemImageAdd(
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
                            child:itemImageAdd(
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
                            child:itemImageAdd(
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
                            child:itemImageAdd(
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
                            child:itemImageAdd(
                                context: context,
                                onTap: (){
                                  _importImageSelectBottomSheet(context, 5);
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
                            child:itemImageAdd(
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
                        child: Text("عنوان مقاله:" ,
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
                        child: Text("توضیحات کوتاه راجع به مقاله:" ,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                      textFormFieldHintWidget(
                          context: context,
                          focus: _summaryFocus,
                          controller: _summaryController,
                          hint: " ",
                          maxLine: 5,
                          minLine: 1,
                          keyboardType: TextInputType.multiline,
                          maxLength: 1000),

                      Padding(
                        padding:  EdgeInsets.only( top: 30 , bottom: 15),
                        child: Text("توضیحات کامل راجع به مقاله:" ,
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
                          maxLine: 80,
                          minLine: 20,
                          keyboardType: TextInputType.multiline,
                          maxLength: 1000),

                      Padding(
                        padding:  EdgeInsets.only( top: 30 , bottom: 5),
                        child: Text("تگ های راجع به مقاله:" ,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only( top: 5 , bottom: 10),
                        child: Text("افزودن تگ باعث بهتر شناخته شدن مقاله شما خواهد شد." ,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              color: Colors.black
                          ),),
                      ),
                      TagEditor(
                        length: _values.length,
                        delimiters: [',', ' '],
                        hasAddButton: true,
                        inputDecoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'عنوان تگ',
                        ),
                        onTagChanged: (newValue) {
                          setState(() {
                            _values.add(newValue);
                          });
                        },
                        tagBuilder: (context, index) => _Chip(
                          index: index,
                          label: _values[index],
                          onDeleted: _onDelete,
                        ),
                      ),
                      // textFormFieldHintWidget(
                      //     context: context,
                      //     focus: _tagFocus,
                      //     controller: _tagController,
                      //     hint: "",
                      //     maxLine: 10,
                      //     minLine: 1,
                      //     keyboardType: TextInputType.multiline,
                      //     maxLength: 1000),

                      Container(
                        padding:EdgeInsets.only(bottom: 15,top: 15),
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
                            if(_summaryController.text.isEmpty){
                              if(mounted){
                                setState(() {
                                  errorSnackBar(text: "قیمت محصول را وارد نمایید", error: true,context: context);
                                });
                              }
                              return;
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

                            articleFunction.addArticle(token: _token,
                                title: _titleController.text,
                                description: _desController.text,
                                category: _idCat.toString(),
                                pics: _imageUrl,
                                summary: _summaryController.text,
                                tags: _values,).then((value){
                              if(value == 200){
                                if(mounted){
                                  setState(() {
                                    _loadToSend = false;
                                    _titleController.text="";
                                    _desController.text="";
                                    _summaryController.text="";
                                    _imageUrl.clear();
                                    _bool.map((e) => e = false);
                                  });
                                }
                                listSnackBar(list: articleFunction.errorMassages, err: false,);
                              }else{
                                if(mounted){
                                  setState(() {
                                    _loadToSend = false;
                                  });
                                }
                                listSnackBar(list: articleFunction.errorMassages, err: true,);
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
                            "ثبت و ارسال",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              )),
        )));
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
              aspectRatio: 1,
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

  _initView() {
    _titleFocus = FocusNode();
    _desFocus = FocusNode();
    _summaryFocus = FocusNode();
    _tagFocus = FocusNode();

    _titleController = TextEditingController();
    _desController = TextEditingController();
    _summaryController = TextEditingController();
    _tagController = TextEditingController();

  }

  _disposeView(){
    _tagController .dispose();
    _tagFocus .dispose();
    _titleFocus .dispose();
    _desFocus .dispose();
    _summaryController .dispose();
    _summaryFocus .dispose();
    _titleController.dispose();
    _desController.dispose();
  }

}
class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}