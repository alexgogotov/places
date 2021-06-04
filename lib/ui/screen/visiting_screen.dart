import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card_want_to_visit.dart';
import 'package:places/ui/screen/sight_card_visited.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';

class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Избранное',
            style: normal.copyWith(
                color: Theme.of(context).colorScheme.titleColor),
          )),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            MyTabBarController(tabController),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              Column(children: [
                SizedBox(
                  height: 16,
                ),
                SightCardWantToVisit(mocks[0])
              ]),
              Column(children: [
                SizedBox(
                  height: 16,
                ),
                SightCardVisited(mocks[1])
              ]),
            ]))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/list.png")),
              title: Text('')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/map.png")),
              title: Text('')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/heart-fill.png")),
              title: Text('')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/settings.png")),
              title: Text('')),
        ]));
  }
}

class MyTabBarController extends StatelessWidget {
  TabController tabController;

  MyTabBarController(this.tabController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 14),
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.cardBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(40), right: Radius.circular(40)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        tabController.index == 0
                            ? Theme.of(context).colorScheme.selectedColor
                            : Theme.of(context)
                                .colorScheme
                                .cardBackgroundColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ))),
                child: Text(
                  'Хочу посетить',
                  style: TextStyle(
                      color: tabController.index == 0
                          ? Theme.of(context).colorScheme.titleAntiColor
                          : Theme.of(context).colorScheme.unselectedColor),
                ),
                onPressed: () {
                  tabController.animateTo(0);
                }),
          ),
          Expanded(
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        tabController.index == 1
                            ? Theme.of(context).colorScheme.selectedColor
                            : Theme.of(context)
                                .colorScheme
                                .cardBackgroundColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ))),
                child: Text(
                  'Посетил',
                  style: TextStyle(
                      color: tabController.index == 1
                          ? Theme.of(context).colorScheme.titleAntiColor
                          : Theme.of(context).colorScheme.unselectedColor),
                ),
                onPressed: () {
                  tabController.animateTo(1);
                }),
          )
        ],
      ),
    );
  }
}
