import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

class NewRegisterPage extends StatefulWidget {
  const NewRegisterPage({Key key}) : super(key: key);

  @override
  _NewRegisterPageState createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisterPage> {

  final RegisterFunction _regFunction = Get.put(RegisterFunction());

  bool _desOpen = true;
  bool _workOpen = true;
  bool _typeUser = true;

  List _title = [
    'نوع کاربری',
    'تاریخ پایان',
  ];

  List<String> accountList = ['کاربر', 'باشگاه', 'مربی', 'دکتر', 'فروشگاه'];

  TextEditingController _nameController;
  FocusNode _nameFocus;

  TextEditingController _mobileController;
  FocusNode _mobileFocus;

  TextEditingController _desController;
  FocusNode _desFocus;

  TextEditingController _pasController;
  FocusNode _pasFocus;
  
  TextEditingController _rePasController;
  FocusNode _rePasFocus;


  void _initView() {
    _nameController = TextEditingController();
    _mobileController = TextEditingController(text: _regFunction.mobile.value);
    _desController = TextEditingController();
    _pasController = TextEditingController();
    _rePasController = TextEditingController();
    _nameFocus = FocusNode();
    _mobileFocus = FocusNode();
    _desFocus = FocusNode();
    _pasFocus = FocusNode();
    _rePasFocus = FocusNode();

  }
  
  void _disView() {
    _nameController.dispose();
    _nameFocus.dispose();
    _mobileController.dispose();
    _mobileFocus.dispose();
    _desController.dispose();
    _desFocus.dispose();
    _pasController.dispose();
    _pasFocus.dispose();
    _rePasController.dispose();
    _rePasFocus.dispose();
  }

  @override
  void initState() {
    _initView();
    super.initState();
  }

@override
  void dispose() {
    _disView();   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'ثبت نام',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          body:SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/image/back.png'
                      ),
                      fit: BoxFit.fill
                  )
              ),
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15 , right: 15 , top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("اطلاعات شخصی" , style: TextStyle(
                                  fontSize: 14 , color: Colors.black , fontWeight: FontWeight.bold
                              ),),
                              InkWell(
                                  onTap: () {
                                    if(mounted){
                                      setState(() {
                                        _desOpen = !_desOpen;
                                      });
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(_desOpen?Icons.keyboard_arrow_down_sharp :Icons.keyboard_arrow_up_sharp, color: Colors.black ,size: 18,),
                                  )),
                            ],
                          ),
                        ),
                        _desOpen? Container(
                          margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
                          height: 1,
                          color: Colors.grey[400],
                        ):SizedBox(height: 20,),
                        if(_desOpen)
                          Padding(
                            padding: EdgeInsets.only(bottom: 20 , right: 15 , left: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: formTextLabelWidget(
                                          context: context,
                                          controller: _nameController,
                                          focus: _nameFocus,
                                          readeOnly: false,
                                          label: "نام کامل",
                                          maxLine: 1,
                                          minLine: 1,
                                          keyboardType: TextInputType.text,
                                          maxLength: 200),
                                    ),
                                    SizedBox(width: 8,),
                                    Expanded(
                                      child: formTextLabelWidget(
                                          context: context,
                                          controller: _mobileController,
                                          focus: _mobileFocus,
                                          readeOnly: true,
                                          label: "موبایل",
                                          maxLine: 1,
                                          minLine: 1,
                                          keyboardType: TextInputType.number,
                                          maxLength: 11),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: formTextLabelWidget(
                                          context: context,
                                          controller: _pasController,
                                          focus: _pasFocus,
                                          readeOnly: false,
                                          label: "رمز عبور",
                                          maxLine: 1,
                                          minLine: 1,
                                          keyboardType: TextInputType.text,
                                          maxLength: 2000),
                                    ),
                                    SizedBox(width: 8,),
                                    Expanded(
                                      child: formTextLabelWidget(
                                          context: context,
                                          controller: _rePasController,
                                          focus: _rePasFocus,
                                          readeOnly: false,
                                          label: "تکرار رمز عبور",
                                          maxLine: 1,
                                          minLine: 1,
                                          keyboardType: TextInputType.text,
                                          maxLength: 2000),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child:formTextLabelWidget(
                                      context: context,
                                      controller: _desController,
                                      focus: _desFocus,
                                      readeOnly: false,
                                      label: "توضیحات",
                                      maxLine: 10,
                                      minLine: 4,
                                      keyboardType: TextInputType.multiline,
                                      maxLength: 9000000000),
                                ),

                              ],
                            )
                          )

                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15 , right: 15 , top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("اطلاعات کاری" , style: TextStyle(
                                  fontSize: 14 , color: Colors.black , fontWeight: FontWeight.bold
                              ),),
                              InkWell(
                                  onTap: () {
                                    if(mounted){
                                      setState(() {
                                        _workOpen = !_workOpen;
                                      });
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(_workOpen?Icons.keyboard_arrow_down_sharp :Icons.keyboard_arrow_up_sharp, color: Colors.black ,size: 18,),
                                  )),
                            ],
                          ),
                        ),
                        _workOpen? Container(
                          margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
                          height: 1,
                          color: Colors.grey[400],
                        ):SizedBox(height: 20,),
                        if(_workOpen)
                          Padding(
                            padding: EdgeInsets.only(bottom: 20 , right: 15 , left: 15),
                            child: Column(
                              children: [
                                textSelected(
                                    context: context,
                                    title: _title[0],
                                    bool: _typeUser,
                                    tapFunction: () {
                                        Get.dialog(_dialogTypeUser());
                                    },
                                    hoverFunction: (value) {

                                    },
                                    widthSize: Get.width,
                                    selected: _title[0] == "نوع کاربری"
                                        ? false
                                        : true)
                              ],
                            )
                          )

                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                      child: Text(
                        "تایید و ثبت نام",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  _dialogTypeUser() {
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
                            Text("نوع کاربری را انتخاب کنید",style: TextStyle(
                                color: Colors.white,
                                fontSize: 13
                            ),)
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount:
                          accountList.length,
                          shrinkWrap: true,
                          physics:
                          NeverScrollableScrollPhysics(),
                          itemBuilder:
                              (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.back();
                                if(mounted){
                                  setState(() {
                                    _title[0] = accountList[index];
                                  });
                                }

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                width: Get.width,
                                child: Text(
                                  accountList[index],
                                  textAlign: TextAlign
                                      .center,
                                  style: TextStyle(
                                      fontSize: 16),
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: 20,),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
