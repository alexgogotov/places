import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';

class FiltersScreen extends StatefulWidget {
  Map categoriesState;
  int distanceTo;

  FiltersScreen(this.categoriesState, this.distanceTo);

  @override
  _FiltersScreenState createState() => _FiltersScreenState(categoriesState, distanceTo);
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map categoriesState;
  int distanceTo;

  _FiltersScreenState(this.categoriesState, this.distanceTo);

  int indexOfSearchOption;
  final searchOption = [
    100,
    250,
    500,
    1000,
    2000,
    3000,
    4000,
    5000,
    7500,
    10000
  ];
  final searchOptionDescription = [
    radius0Text,
    radius1Text,
    radius2Text,
    radius3Text,
    radius4Text,
    radius5Text,
    radius6Text,
    radius7Text,
    radius8Text,
    radius9Text
  ];

  @override
  void initState() {
    super.initState();

    indexOfSearchOption = 0;
    for(int dist in searchOption) {
      if (dist==distanceTo) break;
      indexOfSearchOption ++;
    }
  }

  Widget createCategoryButton(keysCategories category) {
    return CategoryButton(category, categoriesState[category], () {
      setState(() {
        categoriesState[category] = !categoriesState[category];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: [
          TextButton(
              child: Text(
                clearText,
                style: normal.copyWith(
                    color: Theme.of(context).colorScheme.buttonBackgroundColor),
              ),
              onPressed: () {
                setState(() {
                  for (var k in categoriesState.keys) {
                    categoriesState[k] = false;
                  }
                });
              })
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 16, top: 24, bottom: 24),
              alignment: Alignment.topLeft,
              child: Text(categoriesText,
                  style: normal12.copyWith(
                      color: Theme.of(context).colorScheme.unselectedColor))),
          Row(
            children: [
              Expanded(child: createCategoryButton(keysCategories.hotel)),
              Expanded(child: createCategoryButton(keysCategories.restourant)),
              Expanded(
                  child: createCategoryButton(keysCategories.particularPlace)),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(child: createCategoryButton(keysCategories.park)),
              Expanded(child: createCategoryButton(keysCategories.museum)),
              Expanded(child: createCategoryButton(keysCategories.cafe)),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 60),
              child: Row(
                children: [
                  Text(distanceText, style: normal),
                  Expanded(
                      child: Text(searchOptionDescription[indexOfSearchOption],
                          textAlign: TextAlign.right, style: normal))
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 4, right: 4, top: 16),
              child: Slider(
                  divisions: 9,
                  min: 0,
                  max: 9,
                  activeColor:
                      Theme.of(context).colorScheme.buttonBackgroundColor,
                  inactiveColor: Theme.of(context).colorScheme.unselectedColor,
                  value: indexOfSearchOption.toDouble(),
                  onChanged: (currentValue) {
                    setState(() {
                      indexOfSearchOption = currentValue.toInt();
                    });
                  })),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                height: 48,
                width: double.infinity,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context)
                                .colorScheme
                                .buttonBackgroundColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: Text(
                      showText,
                      style: normal.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop({
                        'categoriesState': categoriesState,
                        'distanceTo': searchOption[indexOfSearchOption]
                      });
                    })),
          ))
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final keysCategories name;
  final bool isChecked;
  void Function() onPressed;

  CategoryButton(this.name, this.isChecked, this.onPressed);

  String pathToIcon() {
    if (name == keysCategories.hotel) return 'res/icons/catalog/hotel.png';
    if (name == keysCategories.restourant)
      return 'res/icons/catalog/restourant.png';
    if (name == keysCategories.particularPlace)
      return 'res/icons/catalog/particular-place.png';
    if (name == keysCategories.park) return 'res/icons/catalog/park.png';
    if (name == keysCategories.museum) return 'res/icons/catalog/museum.png';
    if (name == keysCategories.cafe) return 'res/icons/catalog/cafe.png';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .cardBackgroundColor
                .withOpacity(1),
            shape: BoxShape.circle,
          ),
          child: Stack(children: [
            Center(
                child: IconButton(
                    icon: ImageIcon(AssetImage(pathToIcon()),
                        color:
                            Theme.of(context).colorScheme.buttonBackgroundColor,
                        size: 32.0),
                    onPressed: onPressed)),
            Positioned(
                bottom: 0,
                right: 0,
                child: isChecked
                    ? Icon(Icons.check_circle, size: 16.0, color: Colors.black)
                    : SizedBox.shrink())
          ])),
      SizedBox(height: 12),
      Text(textByKeyCategory(name), style: normal12),
    ]);
  }
}
