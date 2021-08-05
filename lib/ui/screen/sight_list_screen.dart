import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';

import 'package:places/main.dart';
import 'package:places/ui/screen/visiting_screen.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  Map categoriesState = {
    keysCategories.hotel: false,
    keysCategories.restourant: false,
    keysCategories.particularPlace: false,
    keysCategories.park: false,
    keysCategories.museum: false,
    keysCategories.cafe: false,
  };
  int distanceTo = 10000;
  List<String> searchHistory = [];

  List<Widget> listOfMockWidget() {
    List<Widget> children = [];
    for (var m in mocks) {
      children.add(SightCard(m));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            listOfInterestingPlacesText,
            style: normal.copyWith(
                color: Theme.of(context).colorScheme.titleColor),
          )),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(children: [
          SearchRow(() async {
            var value = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => SightSearchScreen(
                      categoriesState, distanceTo, searchHistory)),
            );

            if (value != null) {
              searchHistory = value['searchHistory'];
            }
          }, () async {
            var value = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      FiltersScreen(categoriesState, distanceTo)),
            );

            if (value != null) {
              categoriesState = value['categoriesState'];
              distanceTo = value['distanceTo'];
            }
          }),
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: listOfMockWidget()),
          ))
        ]),
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

              if (indexOfBNB == 2)
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => VisitingScreen()),
                );
            }),
        floatingActionButton: Container(
            width: 177,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              gradient: LinearGradient(
                  colors: [Color(0xfffcdd3d), Color(0xff4caf50)]),
            ),
            child: TextButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddSightScreen()),
                );

                setState(() {});
              },
              child: Row(children: [
                SizedBox(width: 16),
                Icon(Icons.add, color: Colors.white),
                Expanded(
                    child: Text(
                  newPlaceText.toUpperCase(),
                  style: small.copyWith(color: Colors.white),
                  textAlign: TextAlign.right,
                )),
                SizedBox(width: 16)
              ]),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Container(
          width: double.infinity,
          height: 72,
          margin: EdgeInsets.only(top: 14),
          child: Text(
            'Список\nинтересных мест',
            maxLines: 2,
            style: largeTitle.copyWith(
                color: Theme.of(context).colorScheme.titleColor),
          ),
        ),
        toolbarHeight: height,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        titleSpacing: 16);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class SearchRow extends StatelessWidget {
  void Function() onTap;
  void Function() onFilterPressed;

  SearchRow(this.onTap, this.onFilterPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )),
        child: Stack(children: [
          TextField(
              onTap: onTap,
              style: text,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15.0),
                hintText: searchText,
                prefixIcon: Image.asset("res/icons/search.png"),
              )),
          Positioned(
              right: 0,
              child: IconButton(
                onPressed: onFilterPressed,
                icon: Image.asset("res/icons/filter.png"),
              ))
        ]));
  }
}
