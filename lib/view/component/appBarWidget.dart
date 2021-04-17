import 'package:flutter/material.dart';

typedef void OnPressed();
class AppBarWidget extends StatelessWidget {

  OnPressed onShopPressed;
  OnPressed onBackPressed;
  int from;
  AppBarWidget({@required this.onShopPressed,@required this.onBackPressed,@required this.from});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
        child: IntrinsicHeight(
          child: Row(
            children: [
              IconButton(
                onPressed: onShopPressed,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                  color: Colors.grey[600],
                ),
                // icon: FaIcon(FontAwesomeIcons.shoppingCart,size: 18 , color: Colors.grey[800],),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 25, color: Colors.grey[600]),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:Text("جستجو در اسپورت" , style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                          color: Colors.grey[600]
                      ),)

                    )
                  ],
                ),
              )),
              SizedBox(
                width: 4,
              ),
              from == 1?  SizedBox(
                width: 4,
              ):Container(),
              from == 1?  IconButton(
                onPressed: onBackPressed,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(
                  Icons.arrow_forward,
                  size: 24,
                  color: Colors.black,
                ),
                // icon: FaIcon(FontAwesomeIcons.shoppingCart,size: 18 , color: Colors.grey[800],),
              ):Container(),
            ],
          ),
        ),
      ),
    );
  }
}
