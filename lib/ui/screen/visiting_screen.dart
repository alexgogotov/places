import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card_want_to_visit.dart';
import 'package:places/ui/screen/sight_card_visited.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';

import 'package:places/main.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

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
          style:
              normal.copyWith(color: Theme.of(context).colorScheme.titleColor),
        )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          MyTabBarController(tabController),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            Column(
                children: mocks_want_to_visit
                    .map((t) => SightCardWantToVisit(t, () {
                          int indexToDelete = 0;
                          for (var m in mocks_want_to_visit) {
                            if (m.name == t.name) break;
                            indexToDelete++;
                          }
                          mocks_want_to_visit.removeAt(indexToDelete);

                          setState(() {});
                        }))
                    .toList()),
            Column(
                children:
                    mocks_visited.map((t) => SightCardVisited(t)).toList()),
          ]))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexOfBNB,
          items: [
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
          ],
          onTap: (int index) {
            indexOfBNB = index;

            if (indexOfBNB == 0)
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SightListScreen()),
              );
          }),
    );
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
