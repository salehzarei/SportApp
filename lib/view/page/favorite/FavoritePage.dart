import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/favorite/ArticleFavoritePage.dart';
import 'package:sportapplication/view/page/favorite/PackageFavoritePage.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark, // status bar brightness
        title: Text(
          "علاقه مندی ها",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
           )
        ),
        leading:IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Get.back();
            }) ,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
                text: "پکیج ها",
                icon: SvgPicture.asset(
                  "assets/svg/shop.svg",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                )
            ),
            Tab(
                text: "مقالات ",
                icon: SvgPicture.asset(
                  "assets/svg/gym.svg",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                )
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          PackageFavoritePage(),
          ArticleFavoritePage(),
        ],
        controller: _tabController,
      ),
    );
  }

}
