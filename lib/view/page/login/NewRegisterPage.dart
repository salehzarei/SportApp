import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:sportapplication/Model/CategoryAccountTypeModel.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/MainPage.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/login/SelectAddressPage.dart';

class NewRegisterPage extends StatefulWidget {
  const NewRegisterPage({Key key}) : super(key: key);

  @override
  _NewRegisterPageState createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisterPage> {
  final RegisterFunction _regFunction = Get.put(RegisterFunction());
  final FirebaseMessaging _firebaseToken = FirebaseMessaging();

  bool _desOpen = true;
  bool _workOpen = true;
  bool _typeUser = true;
  bool _addressSelected = true;
  bool _activityScope = true;
  bool _interest = true;

  bool _clicked = false;

  List _title = [
    'نوع کاربری',
    'انتخاب آدرس',
    'علاقه مندی',
    'حوزه فعالیت',
  ];

  List<String> accountList = ['کاربر', 'باشگاه', 'مربی', 'دکتر', 'فروشگاه'];
  List<String> accountId = ['1', '2', '3', '4', '5'];
  List interestId = [];
  List interestIdFinal = [];
  List scopeId = [];
  List scopeIdFinal = [];

  List<bool> _valCatInterest = [];

  String idType = "1";

  LatLng _lastMapPosition;

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
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/back.png'),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "اطلاعات شخصی",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        _desOpen = !_desOpen;
                                      });
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      _desOpen
                                          ? Icons.keyboard_arrow_down_sharp
                                          : Icons.keyboard_arrow_up_sharp,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        _desOpen
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                height: 1,
                                color: Colors.grey[400],
                              )
                            : SizedBox(
                                height: 20,
                              ),
                        if (_desOpen)
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: 20, right: 15, left: 15),
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
                                      SizedBox(
                                        width: 8,
                                      ),
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
                                  SizedBox(
                                    height: 8,
                                  ),
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
                                      SizedBox(
                                        width: 8,
                                      ),
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
                                    child: formTextLabelWidget(
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
                                  textSelected(
                                      context: context,
                                      title: _title[1],
                                      bool: _addressSelected,
                                      tapFunction: () {
                                        Get.to(SelectAddressPage(
                                          onclick: (String title, LatLng loc) {
                                            if (mounted) {
                                              setState(() {
                                                _title[1] = title;
                                                _lastMapPosition = loc;
                                              });
                                            }
                                          },
                                        ));
                                      },
                                      hoverFunction: (value) {},
                                      widthSize: Get.width,
                                      selected: _title[1] == "انتخاب آدرس"
                                          ? false
                                          : true)
                                ],
                              ))
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "اطلاعات کاری",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        _workOpen = !_workOpen;
                                      });
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      _workOpen
                                          ? Icons.keyboard_arrow_down_sharp
                                          : Icons.keyboard_arrow_up_sharp,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        _workOpen
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                height: 1,
                                color: Colors.grey[400],
                              )
                            : SizedBox(
                                height: 20,
                              ),
                        if (_workOpen)
                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 20, right: 15, left: 15),
                                  child: Column(
                                    children: [
                                      textSelected(
                                          context: context,
                                          title: _title[0],
                                          bool: _typeUser,
                                          tapFunction: () {
                                            Get.dialog(_dialogTypeUser());
                                          },
                                          hoverFunction: (value) {},
                                          widthSize: Get.width,
                                          selected: _title[0] == "نوع کاربری"
                                              ? false
                                              : true)
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 20, right: 15, left: 15),
                                  child: Column(
                                    children: [
                                      textSelected(
                                          context: context,
                                          title: _title[2],
                                          bool: _interest,
                                          tapFunction: () {
                                            _valCatInterest = [];
                                            interestId = [];
                                            _regFunction
                                                .getProductCategories(0)
                                                .whenComplete(() {
                                              _regFunction.categoryList
                                                  .forEach((element) {
                                                _valCatInterest.add(false);
                                              });

                                              print("asdfasdf");
                                              print(
                                                  _regFunction.categoryLoading);
                                              print(_regFunction
                                                  .categoryList.length);
                                              print(_valCatInterest.length);

                                              Get.dialog(_dialogTypeInterest(
                                                  " علاقه مندی ها: ", 1));
                                            });
                                          },
                                          hoverFunction: (value) {},
                                          widthSize: Get.width,
                                          selected: _title[2] == "علاقه مندی"
                                              ? false
                                              : true)
                                    ],
                                  )),
                              if (idType != "1")
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 20, right: 15, left: 15),
                                    child: Column(
                                      children: [
                                        textSelected(
                                            context: context,
                                            title: _title[3],
                                            bool: _activityScope,
                                            tapFunction: () {
                                              _valCatInterest = [];
                                              scopeId = [];
                                              _regFunction
                                                  .getProductCategories(
                                                      int.parse(idType))
                                                  .whenComplete(() {
                                                _regFunction.categoryList
                                                    .forEach((element) {
                                                  _valCatInterest.add(false);
                                                });

                                                print("asdfasdf");
                                                print(_regFunction
                                                    .categoryLoading);
                                                print(_regFunction
                                                    .categoryList.length);
                                                print(_valCatInterest.length);

                                                Get.dialog(_dialogTypeInterest(
                                                    " حوزه فعالیت : ", 2));
                                              });
                                            },
                                            hoverFunction: (value) {},
                                            widthSize: Get.width,
                                            selected: _title[3] == "حوزه فعالیت"
                                                ? false
                                                : true)
                                      ],
                                    )),
                            ],
                          )
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isEmpty) {
                          errorSnackBar(
                              text: "نام کاربری را وارد کنید",
                              error: true,
                              context: context);
                          return;
                        }
                        if (_desController.text.isEmpty) {
                          errorSnackBar(
                              text: "توضیحات را وارد نمایید",
                              error: true,
                              context: context);
                          return;
                        }
                        if (_pasController.text.isEmpty) {
                          errorSnackBar(
                              text: "رمز عبور را وارد کنید",
                              error: true,
                              context: context);
                          return;
                        }
                        if (_rePasController.text.isEmpty) {
                          errorSnackBar(
                              text: "تکرار رمز عبور را وارد کنید",
                              error: true,
                              context: context);
                          return;
                        }
                        if (_rePasController.text != _pasController.text) {
                          errorSnackBar(
                              text: "رمز عبور همخوانی ندارد",
                              error: true,
                              context: context);
                          return;
                        }
                        if (_title[1] == 'انتخاب آدرس') {
                          errorSnackBar(
                              text: "آدرس را وارد کنید",
                              error: true,
                              context: context);
                          return;
                        }
                        if (_title[0] == 'نوع کاربری') {
                          errorSnackBar(
                              text: "نوع کاربری را انتخاب کنید",
                              error: true,
                              context: context);
                          return;
                        }
                        if (interestIdFinal.length < 1) {
                          errorSnackBar(
                              text:
                                  "انتخاب حداقل یک مورد علاقه مندی الزامی است ",
                              error: true,
                              context: context);
                          return;
                        }
                        if (idType != "1") {
                          if (scopeId.length < 1) {
                            errorSnackBar(
                                text:
                                    "انتخاب حداقل یک مورد حوزه فعالیت الزامی است",
                                error: true,
                                context: context);
                            return;
                          }
                        }

                        if (mounted) {
                          setState(() {
                            _clicked = true;
                          });
                        }

                        _register();
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.white))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      child: _clicked
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 25.0,
                              ),
                            )
                          : Text(
                              "تایید و ثبت نام",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                    ),
                  ),
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
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "نوع کاربری را انتخاب کنید",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: accountList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.back();
                                if (mounted) {
                                  setState(() {
                                    _title[0] =
                                        "سطح کاربری انتخاب شده:  ${accountList[index]}";
                                    idType = accountId[index];
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                width: Get.width,
                                child: Text(
                                  accountList[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  void findPersonActivityScopeWhere(List<dynamic> active, int ids) {
    // Find the index of person. If not found, index = -1
    final indexs = active.indexWhere((element) => element == ids);
    if (indexs > -1) {
      active.remove(ids);
    } else {
      active.add(ids);
    }
  }

  _dialogTypeInterest(String title, int f) {
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
              builder: (context, typeInterestSetState) => Directionality(
                  textDirection: TextDirection.ltr,
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
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              title,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        child: !_regFunction.categoryLoading.value
                            ? ListView.builder(
                                itemCount: _regFunction.categoryList.length,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    value: _valCatInterest[index],
                                    onChanged: (bool value) {
                                      if (value) {
                                        if (f == 1) {
                                          interestId.add(_regFunction
                                              .categoryList[index].id);
                                        } else {
                                          scopeId.add(_regFunction
                                              .categoryList[index].id);
                                        }
                                      } else {
                                        if (f == 1) {
                                          interestId.remove(_regFunction
                                              .categoryList[index].id);
                                        } else {
                                          scopeId.remove(_regFunction
                                              .categoryList[index].id);
                                        }
                                      }
                                      if (mounted) {
                                        typeInterestSetState(() {
                                          _valCatInterest[index] = value;
                                        });
                                      }
                                    },
                                    activeColor: Colors.red,
                                    title: Text(
                                      _regFunction.categoryList[index].title,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  );
                                })
                            : loading(color: Colors.red),
                      ),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          width: double.infinity,
                          child: buttonWidget(
                              title: "تایید",
                              onPressed: () {
                                if (f == 1) {
                                  interestIdFinal = interestId;
                                  if (interestIdFinal.isNotEmpty) {
                                    if (mounted) {
                                      setState(() {
                                        _title[2] =
                                            "تعداد  ${interestIdFinal.length}  مورد علاقه مندی انتخاب شده";
                                      });
                                    }
                                  }
                                  print(
                                      "interestIdFinal=>      $interestIdFinal");
                                } else {
                                  scopeIdFinal = scopeId;
                                  if (scopeIdFinal.isNotEmpty) {
                                    if (mounted) {
                                      setState(() {
                                        _title[3] =
                                            "تعداد  ${scopeIdFinal.length}  مورد حوزه فعالت انتخاب شده";
                                      });
                                    }
                                  }
                                }
                                Get.back();
                              },
                              btnColor: Colors.red,
                              txtColor: Colors.white))
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }

  void _register() {
    _firebaseToken.getToken().then((pushToken) => {
          _regFunction
              .sendRegisterData(
                  acivityScope: scopeIdFinal,
                  interest: interestIdFinal,
                  ostan: 0,
                  city: 0,
                  firebase_token: pushToken,
                  name: _nameController.text,
                  level: int.parse(idType),
                  inviteCode: '',
                  email: '',
                  long: _lastMapPosition.longitude.toString(),
                  lat: _lastMapPosition.latitude.toString(),
                  mobile: _regFunction.mobile.value,
                  pass: _pasController.text.trim(),
                  address: _title[1],
                  code: _regFunction.code.value,
                  verificationToken: _regFunction.verificationCode.value,
                  sysApp: 'android')
              .then((value) {
            if (value == 200) {
              Get.offAll(MainPage());
            } else {
              listSnackBar(list: _regFunction.errorMassages, err: true);
            }
          })
        });
  }
}
