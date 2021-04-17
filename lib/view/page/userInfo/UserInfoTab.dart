import 'package:flutter/material.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class UserInfoTab extends StatelessWidget {

  TextEditingController _nameController = TextEditingController(text: "نام خانوادگی کاربر");
  FocusNode _nameFocus = FocusNode();

  TextEditingController _desController = TextEditingController(text: "توضیحات کامل راجع به این کاربر یا یوز کاربری که در چه زمینه ای فعالیت دارد و چه کار هایی انجام میدهد را میتوان از این قسمت نمایش داد");
  FocusNode _desFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10 , bottom: 8),
            width: 100,
            height: 100,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
              child:  Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color:Theme.of(context).primaryColorDark,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/image/avaratbase.png')
                      )
                  ),
              ),
          ),
          Text("نام کاربری",style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
            color: Colors.black
          ),),
          SizedBox(height: 4,),
          userInfoDivider(title: "اطلاعات شخصی"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
            child:formTextLabelWidget(
                context: context,
                controller: _nameController,
                focus: _nameFocus,
                readeOnly: true,
                label: "نام و نام خانوادگی", maxLine: 1, keyboardType: TextInputType.text,maxLength: 200),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
            child:formTextLabelWidget(
                context: context,
                controller: _desController,
                focus: _desFocus,
                readeOnly: true,
                label: "توضیحات", maxLine: 6, keyboardType: TextInputType.multiline,maxLength: 200),
          ),
          userInfoDivider(title: "اطلاعات کاربری"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("نوع کاربری:",style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: Colors.black
                ),),
                Text("مربی",style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: Colors.red
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
