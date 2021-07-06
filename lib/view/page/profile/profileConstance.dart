import 'package:flutter/material.dart';

itemProfile(
    {@required BuildContext context, @required String title, @required onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[600])
            ],
          ),
        ),
        Container(
          color: Colors.grey[300],
          height: 1,
        )
      ],
    ),
  );
}

dividerEditeProfile(BuildContext context, String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    color: Theme.of(context).primaryColor,
    height: 50,
    child: Center(
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

textFieldEditeProfile(
    {@required BuildContext context,
    @required String labeltext,
    bool obscureText = false,
    TextInputType textInputType = TextInputType.text,
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

importImageSelectBottomSheet(
    {BuildContext context,
    String title,
    String title2,
    Function ontap,
    Function ontap2,
    Icon icons,
    Icon icons2}) {
  showModalBottomSheet(
      backgroundColor: Colors.grey[350],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext bc) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 150,
            padding: EdgeInsets.all(15),
            // color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                              leading: icons,
                              title: Text(
                                title,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onTap: () => ontap()),
                          ListTile(
                            leading: icons2,
                            title: Text(
                              title2,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            onTap: () => ontap2(),
                          ),
                          // ListTile(
                          //   leading: Icon(Icons.contact_phone,
                          //       color: Colors.white),
                          //   title: Text(
                          //     'شماره موبایل',
                          //     style: TextStyle(color: Colors.white),
                          //   ),
                          //   onTap: () => {},
                          // ),
                          // ListTile(
                          //   leading:
                          //       Icon(Icons.location_on, color: Colors.white),
                          //   title: Text(
                          //     'موقعیت از روی نقشه',
                          //     style: TextStyle(color: Colors.white),
                          //   ),
                          //   onTap: () => {},
                          // ),
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
