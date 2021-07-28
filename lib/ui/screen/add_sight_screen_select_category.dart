import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';

class SelectCategoryScreen extends StatefulWidget {
  keysCategories selectedCategory;

  SelectCategoryScreen(this.selectedCategory);

  @override
  _SelectCategoryScreenState createState() =>
      _SelectCategoryScreenState(selectedCategory);
}

class _SelectCategoryScreenState extends State {
  keysCategories selectedCategory;

  _SelectCategoryScreenState(this.selectedCategory);

  Widget createCategoryRow(keysCategories category) {
    return CategoryRow(category, selectedCategory == category, () {
      setState(() {
        selectedCategory = category;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
              width: 90,
              child: TextButton(
                  child: Text(
                    cancelText,
                    style: normal.copyWith(
                        color: Theme.of(context).colorScheme.unselectedColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })),
          Expanded(
              child: Text(
            categoryText.toUpperCase(),
            textAlign: TextAlign.center,
            style: normal.copyWith(
                color: Theme.of(context).colorScheme.titleColor),
          )),
          Container(width: 90, child: SizedBox.shrink())
        ]),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          createCategoryRow(keysCategories.hotel),
          createCategoryRow(keysCategories.restourant),
          createCategoryRow(keysCategories.particularPlace),
          createCategoryRow(keysCategories.park),
          createCategoryRow(keysCategories.museum),
          createCategoryRow(keysCategories.cafe),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 150),
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                height: 48,
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            selectedCategory == null
                                ? Theme.of(context)
                                    .colorScheme
                                    .cardBackgroundColor
                                : Theme.of(context)
                                    .colorScheme
                                    .buttonBackgroundColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: Text(
                      saveText,
                      style: selectedCategory == null
                          ? normal.copyWith(
                              color:
                                  Theme.of(context).colorScheme.unselectedColor)
                          : normal.copyWith(color: Colors.white),
                    ),
                    onPressed: selectedCategory == null
                        ? null
                        : () {
                            Navigator.of(context)
                                .pop(textByKeyCategory(selectedCategory));
                          })),
          ))
        ],
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  final keysCategories name;
  final bool isChecked;
  void Function() onTap;

  CategoryRow(this.name, this.isChecked, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue,
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
            alignment: Alignment.topLeft,
            child: Row(children: [
              Text(textByKeyCategory(name), style: text),
              Expanded(child: SizedBox.shrink()),
              isChecked
                  ? Icon(Icons.check,
                      color:
                          Theme.of(context).colorScheme.buttonBackgroundColor)
                  : SizedBox.shrink()
            ])));
  }
}
