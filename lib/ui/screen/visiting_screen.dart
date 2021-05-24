import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card_want_to_visit.dart';
import 'package:places/ui/screen/sight_card_visited.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/text_styles.dart';

class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

//<VisitingScreen>
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
            style: normalBlack,
          )),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: tabController.index == 0
                                  ? const Color(0xff3b3e5b)
                                  : const Color(0xfff5f5f5),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(40),
                                  right: Radius.circular(40)),
                            ),
                            child: Text(
                              'Хочу посетить',
                              style: TextStyle(
                                  color: tabController.index == 0
                                      ? Colors.white
                                      : const Color(0xff7c7e92)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: tabController.index == 1
                                  ? const Color(0xff3b3e5b)
                                  : const Color(0xfff5f5f5),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(40),
                                  right: Radius.circular(40)),
                            ),
                            child: Text(
                              'Посетил',
                              style: TextStyle(
                                  color: tabController.index == 1
                                      ? Colors.white
                                      : const Color(0xff7c7e92)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
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
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('')),
              BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('')),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('')),
              BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('')),
            ]));
  }
}
