
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
typedef void Onckick(val);
class TabViewHeader extends SliverPersistentHeaderDelegate {

  TabController tabController;
  int level;
  Onckick onckick;
  
  TabViewHeader({@required this.tabController,@required this.onckick,@required this.level});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Theme.of(context).primaryColorDark,
        child: TabBar(
          onTap: (value) {
            onckick(value);
          },
          isScrollable: false,
          labelStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'sanse'
          ),
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
                text: "مقالات",
                icon: SvgPicture.asset(
                  "assets/svg/gym.svg",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                )
            ),
            if(level == 3|| level == 2)
              Tab(
                text: level == 3?"مربیان":"باشگاها",
                icon: SvgPicture.asset(
                  "assets/svg/doctor.svg",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                )
            ),
            Tab(
                text: "گالری",
                icon: SvgPicture.asset(
                  "assets/svg/gym.svg",
                  width: 18,
                  height: 18,
                  color: Colors.white,
                )
            ),
          ],
          controller: tabController,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;
}