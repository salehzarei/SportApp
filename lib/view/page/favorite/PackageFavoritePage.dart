import 'package:flutter/material.dart';
import 'package:sportapplication/view/page/favorite/FavoriteConstant.dart';

class PackageFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, index) => itemPackageFav(index: index, context: context),
      ),
    ));
  }

}
