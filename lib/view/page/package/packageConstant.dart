import 'package:flutter/material.dart';
import 'package:sportapplication/controller/util.dart';

itemPackage({@required BuildContext context}){
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 6 , vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("پکیج یک ماهه ویژه",style: TextStyle(
              fontSize: 14,
              color: Colors.black
          )),
         Container(
           height: 1,
           color: Colors.grey[300],
           margin: EdgeInsets.symmetric(vertical: 10),
         ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      maskedText('75000'),
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red[800],
                          // decorationStyle: TextDecorationStyle.double,
                          decorationThickness: 1.5,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${maskedText('50000')} تومان ',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.black)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red)),
                  child: Text(
                    "خرید",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

itemMyBox({@required BuildContext context}){
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 6 , vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "پکیج یک ماهه ویژه",
                  style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              )),
              Text(
                '${maskedText('50000')} تومان ',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
          Container(
           height: 1,
           color: Colors.grey[300],
           margin: EdgeInsets.symmetric(vertical: 10),
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "تاریخ خرید:",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )),
              Text(
                '1400/01/20',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}