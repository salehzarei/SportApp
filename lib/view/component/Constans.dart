import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

divider({@required String title, @required callback}) {
  return Container(
    margin: EdgeInsets.only(left: 4, right: 15, top: 8, bottom: 10),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w200, color: Colors.black),
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
                        fontWeight: FontWeight.w200,
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

textFormFieldHintWidget(
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
        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
            color: Colors.blueGrey[400],
            width: 1.0,
          ),
        ),
        hintText: hint,
        labelStyle: TextStyle(
            fontSize: 14,
            color: focus.hasFocus ? Colors.blueGrey[600] : Colors.blueGrey),
        counterText: "",
      ),
    ),
  );
}

imageShower({@required imageUrl, @required margin, @required fit, @required borderRadius}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.grey,
        // shape: BoxShape.circle,
        borderRadius: borderRadius,
        image: DecorationImage(image: imageProvider,fit: fit),
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
