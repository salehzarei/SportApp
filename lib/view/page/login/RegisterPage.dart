import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterFunction place = Get.put(RegisterFunction());

  final Controller step = Get.put(Controller());
  @override
  void initState() {
    place.getPlaceData().then((v) {
      place.ostanLoding.value = false;
      if (place.ostanSelected > 0) {
        place.fetchCity(place.ostanSelected.value);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ثبت نام',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: step.activeStepOne.value == 0
                                  ? Colors.green
                                  : Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        step.activeSteptwo.value == 1 ? '✓' : '1',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: step.activeStepOne.value == 0
                                ? Colors.green
                                : Colors.black),
                      )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 1,
                      color: step.activeSteptwo.value == 1
                          ? Colors.green
                          : Colors.grey,
                    )),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: step.activeSteptwo.value == 1
                                  ? Colors.green
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        step.activeStepthree.value == 1 ? '✓' : '2',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: step.activeSteptwo.value == 1
                                ? Colors.green
                                : Colors.grey),
                      )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 1,
                      color: step.activeStepthree.value == 1
                          ? Colors.green
                          : Colors.grey,
                    )),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: step.activeStepthree.value == 1
                                  ? Colors.green
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        step.activeStepcomplete.value == 1 ? '✓' : '3',
                        //✓
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: step.activeStepthree.value == 1
                                ? Colors.green
                                : Colors.grey),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                step.stepPlus.value == 0
                    ? Expanded(
                        child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تکمیل اطلاعات شخصی',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              textFieldLogin(
                                  context: context,
                                  labeltext: 'نام و نام خانوادگی',
                                  obscureText: false,
                                  textInputType: TextInputType.text,
                                  icons: null),
                              SizedBox(
                                height: 15,
                              ),
                              textFieldLogin(
                                  context: context,
                                  labeltext: 'شماره همراه',
                                  obscureText: false,
                                  enabled: false,
                                  textInputType: TextInputType.number,
                                  icons: null),
                              SizedBox(
                                height: 15,
                              ),
                              _buildOstanList(context),
                              SizedBox(
                                height: 15,
                              ),
                              _buildCityList(context),
                              SizedBox(
                                height: 15,
                              ),
                              textFieldLogin(
                                  context: context,
                                  labeltext: 'رمز عبور',
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  icons: null),
                              SizedBox(
                                height: 15,
                              ),
                              textFieldLogin(
                                  context: context,
                                  labeltext: 'تکرار رمز عبور',
                                  obscureText: true,
                                  enabled: true,
                                  textInputType: TextInputType.text,
                                  icons: null),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      step.activeSteptwo.value = 1;
                                      step.stepPlus.value = 1;
                                    },
                                    child: Text(
                                      'مرحله بعد',
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context)
                                                    .primaryColor)),
                                  ),
                                ],
                              ),
                            ]),
                      ))
                    : step.stepPlus.value == 1
                        ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    step.activeStepthree.value = 1;
                                    step.stepPlus.value = 2;
                                  },
                                  child: Text(
                                    'مرحله بعد',
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    step.activeStepcomplete.value = 1;
                                    step.stepPlus.value = 2;
                                  },
                                  child: Text(
                                    'تکمیل ثبت نام',
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),
                                ),
                              ],
                            ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOstanList(BuildContext context) {
    return GetBuilder<RegisterFunction>(
      init: RegisterFunction(),
      builder: (g) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          // height: 80,
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2,
                  color: g.ostanSelected.value == 0
                      ? Colors.grey
                      : Theme.of(context).primaryColor)),
          child: FormField<String>(
            onSaved: (value) {
              g.ostanSelected.value = int.parse(value);
            },
            builder: (
              FormFieldState<String> state,
            ) {
              final List<DropdownMenuItem<String>> _ostanArr = [
                (DropdownMenuItem<String>(
                  value: '0',
                  child: Text(
                    'انتخاب استان',
                    style: TextStyle(color: Colors.grey),
                  ),
                ))
              ];
              if (!g.ostanLoding.value) {
                //   final List<DropdownMenuItem<String>> _subjectArr = [];
                if (g.ostanList.length > 0) {
                  g.ostanList.forEach((id, title) {
                    _ostanArr.add(DropdownMenuItem<String>(
                      value: id,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text(
                            title,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ));
                  });
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  new InputDecorator(
                    decoration: const InputDecoration(

                        // fillColor: Colors.grey,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        labelText: 'استان',
                        labelStyle: TextStyle(color: Colors.grey)),
                    child: g.ostanLoding.value
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                          )
                        : DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("انتخاب استان"),
                              value: g.ostanSelected.value != null
                                  ? g.ostanSelected.value.toString()
                                  : '0',
                              dropdownColor: Color(0xff212121),
                              onChanged: (String newValue) {
                                state.didChange(newValue);
                                g.ostanSelected.value = int.parse(newValue);
                                g.citySelected.value = 0;
                                g.fetchCity(int.parse(newValue));
                              },
                              items: _ostanArr,
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCityList(BuildContext context) {
    return GetBuilder<RegisterFunction>(
      init: RegisterFunction(),
      builder: (g2) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: g2.citySelected.value == 0
                      ? Colors.grey
                      : Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(right: 10),
          // color: Theme.of(context).primaryColor,
          child: FormField<String>(
            onSaved: (value) {
              g2.citySelected.value = int.parse(value);
            },
            builder: (
              FormFieldState<String> state,
            ) {
              final List<DropdownMenuItem<String>> _cityArr = [
                (DropdownMenuItem<String>(
                  value: '0',
                  child: Text(
                    'انتخاب شهرستان',
                    style: TextStyle(color: Colors.grey),
                  ),
                )),
              ];
              if (!g2.ostanLoding.value) {
                if (g2.cityList.length > 0) {
                  g2.cityList.forEach((id, title) {
                    _cityArr.add(DropdownMenuItem<String>(
                      value: id,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text(
                            title,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        g2.citySelected.value = int.parse(id);
                        // Get.back();
                      },
                    ));
                  });
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  new InputDecorator(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        labelText: 'شهرستان',
                        labelStyle: TextStyle(color: Colors.grey)),
                    child: g2.cityLoding.value
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                          )
                        : DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("انتخاب شهرستان "),
                              value: g2.citySelected.value != null
                                  ? g2.citySelected.value.toString()
                                  : '0',
                              dropdownColor: Color(0xff212121),
                              onChanged: (String newValue) {
                                state.didChange(newValue);
                                g2.citySelected.value = int.parse(newValue);
                              },
                              items: _cityArr,
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
