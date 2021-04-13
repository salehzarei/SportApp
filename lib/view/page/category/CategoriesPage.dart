import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          _itemCat(context,'assets/svg/coach.svg', 'مربیان',0),
          _itemCat(context,'assets/svg/doctor.svg', 'پزشکان',1),
          _itemCat(context,'assets/svg/gym.svg', 'باشگاه ها',2),
          _itemCat(context,'assets/svg/shop.svg', 'فروشگاه ها',3),
        ],
      ),
    );
  }

  _itemCat(BuildContext context,String image,String title,int indext){
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Theme.of(context).primaryColorDark
                ),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(child: Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w200,color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
