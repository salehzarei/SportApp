import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 25, color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:Text("جستجو در اسپورت" , style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                          color: Colors.black
                      ),)

                    )
                  ],
                ),
              )),
              SizedBox(
                width: 4,
              ),
              IconButton(
                onPressed: () {},
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                  color: Colors.black,
                ),
                // icon: FaIcon(FontAwesomeIcons.shoppingCart,size: 18 , color: Colors.grey[800],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
