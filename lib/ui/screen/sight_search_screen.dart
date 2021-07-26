import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/mocks.dart';

class SightSearchScreen extends StatefulWidget {
  Map categoriesState;
  int distanceTo;
  List<String> searchHistory;

  SightSearchScreen(this.categoriesState, this.distanceTo, this.searchHistory);

  @override
  _SightSearchScreenState createState() =>
      _SightSearchScreenState(categoriesState, distanceTo, searchHistory);
}

class _SightSearchScreenState extends State {
  Map categoriesState;
  int distanceTo;
  final searchTextController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  List<String> searchHistory;
  String stringForSearchResult = '';

  _SightSearchScreenState(this.categoriesState, this.distanceTo,
      this.searchHistory);

  @override
  void initState() {
    super.initState();
    searchTextController.addListener(changeSearchText);
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  changeSearchText() {
    if ((searchTextController.text != '') &&
        ((searchTextController.text.endsWith(' ')) ||
            (searchFocusNode.hasFocus == false))) {
      stringForSearchResult = searchTextController.text.trim();

      if (!searchHistory.contains(stringForSearchResult))
        searchHistory.add(stringForSearchResult);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
              listOfInterestingPlacesText,
              style:
              normal.copyWith(color: Theme
                  .of(context)
                  .colorScheme
                  .titleColor),
            )),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: getBody(),
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
      ]),
    );
  }

  Widget getBody() {
    List<Widget> ch = [];
    ch.add(searchRow(searchTextController, searchFocusNode, searchHistory));
    print(searchTextController.text);
    if (searchTextController.text == '')
      ch.add(getSearchHistoryWidget());
    else
      ch.add(getSearchResultWidget());

    return Column(children: ch);
  }

  Widget getSearchHistoryWidget() {
    if (searchHistory.length == 0) return SizedBox.shrink();

    List<Widget> ch = [];
    ch.add(Row(children: [
      SizedBox(width: 16),
      Text(youWereLookingForText,
          style: normal12.copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .unselectedColor))
    ]));

    for (var sh in searchHistory) {
      ch.add(Row(children: [
        SizedBox(width: 16),
        InkWell(
            child: Text(sh,
                style: text.copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .unselectedColor),
                textAlign: TextAlign.left),
            onTap: () {
              setState(() {
                stringForSearchResult = sh;
                searchTextController.text = sh + ' ';
              });
            }),
        Expanded(child: SizedBox.shrink()),
        IconButton(
          onPressed: () {
            setState(() {
              searchHistory.removeAt(searchHistory.indexOf(sh));
            });
          },
          icon: Icon(Icons.clear,
              color: Theme
                  .of(context)
                  .colorScheme
                  .unselectedColor),
        )
      ]));
    }

    ch.add(Row(children: [
      Container(
          margin: EdgeInsets.only(left: 16, top: 16),
          child: InkWell(
              child: Text(clearHistoryText,
                  style: text.copyWith(
                      color:
                      Theme
                          .of(context)
                          .colorScheme
                          .buttonBackgroundColor),
                  textAlign: TextAlign.left),
              onTap: () {
                setState(() {
                  searchHistory = [];
                });
              }))
    ]));

    return Column(children: ch, crossAxisAlignment: CrossAxisAlignment.start);
  }

  Widget getSearchResultWidget() {
    if (stringForSearchResult == '') return SizedBox.shrink();

    List<Widget> ch = [];

    for (var m in mocks) {
      if (m.name.toLowerCase().contains(stringForSearchResult.toLowerCase()))
        if (categoryIsSelected(m.category, categoriesState))
          ch.add(SightCardSearch(m));
    }
    return Column(children: ch);
  }

  bool categoryIsSelected(keysCategories category, Map categoriesState) {
    List selectedCategories = [];

    if (categoriesState[keysCategories
        .hotel]) selectedCategories.add (keysCategories.hotel);
    if (categoriesState[keysCategories
        .restourant]) selectedCategories.add (keysCategories.restourant);
    if (categoriesState[keysCategories
        .particularPlace]) selectedCategories.add (keysCategories.particularPlace);
    if (categoriesState[keysCategories
        .park]) selectedCategories.add (keysCategories.park);
    if (categoriesState[keysCategories
        .museum]) selectedCategories.add (keysCategories.museum);
    if (categoriesState[keysCategories.cafe]) selectedCategories.add (keysCategories.cafe);

    if (selectedCategories.length == 0) return true;

    if (selectedCategories.indexOf(category) == -1) return false;

    return true;
  }

}

class searchRow extends StatelessWidget {
  final searchTextController;
  FocusNode searchFocusNode;
  List<String> searchHistory;

  //void Function() onPressed;

  searchRow(this.searchTextController, this.searchFocusNode,
      this.searchHistory);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .cardBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )),
        child: TextField(
            controller: searchTextController,
            focusNode: searchFocusNode,
            autofocus: true,
            //onTap: onPressed,
            style: text,
            readOnly: false,
            //enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: 15.0,
                //bottom: 10.0,
                //left: 16.0,
                //right: 16.0,
              ),
              hintText: searchText,
              prefixIcon: Image.asset("res/icons/search.png"),
              suffixIcon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop({'searchHistory': searchHistory});
                },
                icon: Icon(Icons.cancel,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .titleColor),
              ),
            )));
  }
}
