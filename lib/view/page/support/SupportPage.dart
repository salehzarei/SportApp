import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/support/AboutUsPage.dart';
import 'package:sportapplication/view/page/support/CallUsPage.dart';
import 'package:sportapplication/view/page/support/RulesPage.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> with SingleTickerProviderStateMixin{


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
        brightness: Brightness.dark,
        title: Text(
            "پشتیبانی و قوانین",
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
                text: "قوانین",
                icon: SvgPicture.asset(
                  "assets/svg/shop.svg",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                )
            ),
            // Tab(
            //     text: "تماس با ما ",
            //     icon: SvgPicture.asset(
            //       "assets/svg/gym.svg",
            //       width: 18,
            //       height: 18,
            //       color: Colors.white,
            //     )
            // ),
            Tab(
                text: "در باره ما ",
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
          RulesPage(),
          AboutUsPage(),
          // CallUsPage(),

        ],
        controller: _tabController,
      ),
    );
  }
}
