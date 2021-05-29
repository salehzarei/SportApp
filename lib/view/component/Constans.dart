import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

divider({
  @required String title,
  @required callback,
}) {
  return Container(
    margin: EdgeInsets.only(left: 4,  top: 8, bottom: 8),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 15,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(left: 6),
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w100, color: Colors.black87),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: callback,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Text(
                    'مشاهده همه',
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black87,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

textFieldLogin(
    {@required BuildContext context,
    @required String labeltext,
    @required bool obscureText,
    @required TextInputType textInputType,
    TextEditingController controllers,
    Icon icons,
    int maxLength,
    bool enabled = true}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      height: 45,
      child: TextFormField(
        controller: controllers,
        keyboardType: textInputType,
        obscureText: obscureText,
        enableSuggestions: false,
        maxLength: maxLength,
        autocorrect: false,
        enabled: enabled,
        obscuringCharacter: '*',
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          prefixIcon: icons,
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
          counterText: '',
          border: InputBorder.none,
          labelText: labeltext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              // color: Colors.greenAccent,
              color: controllers.text != ''
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    ),
  );
}

textFormFieldSearchHintWidget(
    {@required context,
    @required focus,
    @required controller,
    @required hint,
    @required maxLine,
    @required keyboardType,
    @required onPressed,
    @required maxLength}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      enableSuggestions: false,
      autovalidate: false,
      showCursor: true,
      focusNode: focus,
      enableInteractiveSelection: true,
      keyboardType: keyboardType,
      minLines: maxLine,
      maxLength: maxLength,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 14, color: Color(0xff3D4152)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 1.0,
          ),
        ),
        hintText: hint,
        prefixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.search,
            color: Colors.grey[600],
            size: 25,
          ),
        ),
        labelStyle: TextStyle(
            fontSize: 12,
            color: focus.hasFocus ? Colors.blueGrey[600] : Colors.blueGrey),
        counterText: "",
      ),
    ),
  );
}


textFormFieldHintWidget(
    {@required context,
    @required focus,
    @required controller,
    @required hint,
    @required minLine,
    @required maxLine,
    @required keyboardType,
    @required maxLength}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      enableSuggestions: false,
      autovalidate: false,
      showCursor: true,
      focusNode: focus,
      enableInteractiveSelection: true,
      keyboardType: keyboardType,
      minLines: minLine,
      maxLines: maxLine,
      maxLength: maxLength,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 14, height: 1.2, color: Color(0xff3D4152)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 1.0,
          ),
        ),
        hintText: hint,
        labelStyle: TextStyle(
            fontSize: 12,
            color: focus.hasFocus ? Colors.blueGrey[600] : Colors.blueGrey),
        counterText: "",
      ),
    ),
  );
}

checkBoxItem(
    {@required context,
    @required clicked,
    @required title,
    @required onChanged}) {
  return Row(
    children: [
      Checkbox(
        onChanged: onChanged,
        value: clicked,
        checkColor: Theme.of(context).primaryColorDark,
        activeColor: Colors.transparent,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ],
  );
}

noItem(){
  return Center(
      child:Image(image: AssetImage('assets/image/empty.png'),width: 150,height: 120,)
  );
}

loading({@required color}){
  return Center(
    child: SpinKitThreeBounce(
      color:color,
      size: 30.0,
    ),
  );
}

errorSnackBar({@required String text,@required bool error,@required BuildContext context}) {
  return Get.snackbar('', '',
      titleText: Text(''),
      messageText: Text(
        text,
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor:error?Theme.of(context).primaryColorDark:Colors.green,
      colorText: Colors.white,
      icon: Icon(
        error?Icons.error:Icons.check,
        color: Colors.white,
        size: 40,
      ));
}

formTextLabelWidget(
    {@required BuildContext context,
    @required FocusNode focus,
    @required TextEditingController controller,
    @required String label,
    @required int maxLine,
    @required int minLine,
    @required TextInputType keyboardType,
    @required bool readeOnly,
    @required int maxLength}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      enableSuggestions: false,
      autovalidate: false,
      showCursor: false,
      readOnly: readeOnly,
      focusNode: focus,
      enableInteractiveSelection: true,
      keyboardType: keyboardType,
      maxLines: maxLine,
      minLines: minLine,
      maxLength: maxLength,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 14, height: 1.4,color: Color(0xff3D4152)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.blueGrey[600],
            width: 1.0,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
            color: focus.hasFocus ? Colors.blueGrey[600] : Colors.grey[700],
        ),
        counterText: "",
      ),
    ),
  );
}

imageShower(
    {@required imageUrl,
    @required margin,
    @required fit,
    @required borderRadius}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.grey,
        // shape: BoxShape.circle,
        borderRadius: borderRadius,
        image: DecorationImage(image: imageProvider, fit: fit),
      ),
    ),
    placeholder: (context, url) => Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                fit: fit, image: AssetImage('assets/image/icon.png')),
            borderRadius: borderRadius),
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

dialogBase({@required context, @required child}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(opacity: a1.value, child: child),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

fadeDialogBase(context, child) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

itemImageAdd(
    {@required context,
    @required onTap,
    @required loaded,
    @required imageUri,
    @required title,
    @required imageSelected,
    @required onPressed}) {
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
        aspectRatio: 1,
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
                            border:
                                Border.all(color: Colors.grey[300], width: 1)),
                        child: ClipRRect(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(imageUri),
                              fit: BoxFit.fill,
                            )),
                            child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      colors: [
                                        Colors.black12.withOpacity(.3),
                                        Colors.black12.withOpacity(.3),
                                        Colors.black12.withOpacity(.3),
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: onPressed,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.zoom_in_sharp,
                                          size: 23, color: Colors.white),
                                    ),
                                  ),
                                )
                            ),
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

itemImageloaded({@required context,
  @required onTap,
  @required loaded,
  @required imageUri,
  @required title,
  @required onDelPressed,
  @required onPressed}) {
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
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    style: BorderStyle.solid, color: Colors.grey[300], width: 1)),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[300], width: 1)),
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUri),
                              fit: BoxFit.fill,
                            )),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                colors: [
                                  Colors.black12.withOpacity(.3),
                                  Colors.black12.withOpacity(.3),
                                  Colors.black12.withOpacity(.3),
                                ]),
                          ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: onPressed,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.zoom_in_sharp,
                                          size: 23, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: onDelPressed,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.delete,
                                          size: 23, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ))),
      ),
    ),
  );
}

textSelected(
    {@required context,
    @required title,
    @required bool,
    @required selected,
    @required tapFunction,
    @required hoverFunction,
    @required widthSize}) {
  return InkWell(
    onTap: tapFunction,
    onHover: hoverFunction,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      width: widthSize,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey[400], width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.black : Colors.black26,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: selected ? Colors.black : Colors.black26,
          )
        ],
      ),
    ),
  );
}

sliderWidget({
  @required int length,
  @required bool loading,
  @required context,
  @required  margin,
  @required borderRadius,
  @required fit,
  @required list,
  @required bool lisString,
  @required aspectRatio,
}){
  return  AspectRatio(
    aspectRatio: aspectRatio,
    child: Padding(
      padding: EdgeInsets.all(4.0),
      child: loading? Center(
        child: SpinKitThreeBounce(
          color: Theme.of(context).primaryColorDark,
          size: 25.0,
        ),
      ):Swiper(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          return imageShower(imageUrl:lisString?list[index] : list[index].pic,
              margin: margin,
              borderRadius: borderRadius, fit: fit);
        },
        autoplay: true,
        duration: 100,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                size: 6.0, activeSize: 10.0, space: 4.0),
            margin: EdgeInsets.only(bottom: 20)
        ),

        // viewportFraction: 0.8,
        // scale: 0.9,
      ),
    ),
  );
}



botSheet({
  @required BuildContext context ,
  @required TextEditingController controller ,
  @required TextEditingController codeController ,
  @required FocusNode focusNode,
  @required FocusNode codeFocus,
  @required changePass} ) {
  showModalBottomSheet(context: context,
      // backgroundColor: Theme.of(context).primaryColorDark,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding:EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5,
                  width: 50,
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      color:Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(20)),
                ),
                textFormFieldHintWidget(
                    context: context,
                    focus: codeFocus,
                    controller: codeController,
                    hint: "کد ارسال شده",
                    maxLine: 1,
                    minLine: 1,
                    keyboardType: TextInputType.number,
                    maxLength: 1000),

                SizedBox(height: 15,),

                textFormFieldHintWidget(
                    context: context,
                    focus: focusNode,
                    controller: controller,
                    hint: "رمز  عبور جدید",
                    maxLine: 1,
                    minLine: 1,
                    keyboardType: TextInputType.text,
                    maxLength: 1000),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("مشخصات پلن:",style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.black
                //     ),),
                //     Text(planList.title ,style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.black87
                //     ),)
                //   ],
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "قیمت:",
                //         style: TextStyle(fontSize: 15, color: Colors.black),
                //       ),
                //       Row(
                //         children: [
                //           planList.off == 0
                //               ? Container()
                //               : Text(
                //             maskedText(planList.price.toString()),
                //             style: TextStyle(
                //                 decoration: TextDecoration.lineThrough,
                //                 decorationColor: Colors.red[800],
                //                 // decorationStyle: TextDecorationStyle.double,
                //                 decorationThickness: 1.5,
                //                 color: Colors.grey[500],
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 13),
                //           ),
                //           SizedBox(
                //             width: 5,
                //           ),
                //           Text(
                //             '${maskedText(( planList.price - planList.off).toString())} تومان ',
                //             style: TextStyle(
                //                 color: Colors.green,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // IntrinsicHeight(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: textFormFieldHintWidget(
                //             context: context,
                //             focus: focusNode,
                //             controller: controller,
                //             hint: "کد تخفیف",
                //             maxLine: 1,
                //             minLine: 1,
                //             keyboardType: TextInputType.text,
                //             maxLength: 1000),
                //       ),
                //       SizedBox(width: 10,),
                //       ElevatedButton(
                //         onPressed: checkCouponClick,
                //         style: ButtonStyle(
                //             shape: MaterialStateProperty.all<
                //                 RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(8.0),
                //                     side: BorderSide(color: Colors.white))),
                //             backgroundColor:
                //             MaterialStateProperty.all<Color>(Colors.red)),
                //         child: Text(
                //           "ثبت",
                //           style: TextStyle(fontSize: 12, color: Colors.white),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 15,),
                // Divider(height: 1,color: Colors.grey[300],),
                // SizedBox(height: 6,),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 15),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "قیمت نهایی:",
                //         style: TextStyle(fontSize: 15, color: Colors.black),
                //       ),
                //       Text(
                //         '${maskedText(( planList.price - planList.off).toString())} تومان ',
                //         style: TextStyle(
                //             color: Colors.green,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 15),
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child:ElevatedButton(
                        onPressed: changePass,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red))),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                        child: Text(
                          "ثبت",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child:ElevatedButton(
                        onPressed: () {
                          Get.back();
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
                          "انصراف",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ));
}

buttonWidget({@required String title,@required onPressed,@required btnColor,@required txtColor,}){
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        shape: MaterialStateProperty.all<
            RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              // side: BorderSide(color: Colors.white)
            )),
        backgroundColor:
        MaterialStateProperty.all<Color>(btnColor)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: txtColor),
      ),
    ),
  );
}
