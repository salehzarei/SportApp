import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dotted_border/dotted_border.dart';

divider({
  @required String title,
  @required callback,
}) {
  return Container(
    margin: EdgeInsets.only(left: 4, right: 16, top: 8, bottom: 8),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w100, color: Colors.black),
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
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black,
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
      // padding: EdgeInsets.symmetric(horizontal: 0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(width: 1, color: Theme.of(context).primaryColor)),
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
          // icon: icons,
          prefixIcon: icons,
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(color: Colors.black, fontSize: 16),
          counterText: '',
          border: InputBorder.none,
          labelText: labeltext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              // color: Colors.greenAccent,
              color: controllers.text != ''
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[600],
          size: 25,
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

errorSnackBar({@required String text}) {
  return Get.snackbar('', '',
      titleText: Text(''),
      messageText: Text(
        text,
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(
        Icons.error,
        color: Colors.white,
        size: 40,
      ));
}

formTextLabelWidget(
    {@required context,
    @required focus,
    @required controller,
    @required label,
    @required maxLine,
    @required keyboardType,
    @required readeOnly,
    @required maxLength}) {
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
      maxLength: maxLength,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: TextStyle(fontSize: 14, color: Color(0xff3D4152)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(6.0),
        //   borderSide: BorderSide(
        //     color: Colors.grey[400],
        //     width: 1.0,
        //   ),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark,
            width: 1.0,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: Theme.of(context).primaryColorDark,
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
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.black : Colors.black26,
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
          return imageShower(imageUrl: list[index].pic,
              margin: margin,
              borderRadius: borderRadius, fit: fit);
        },
        autoplay: true,
        duration: 10,
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