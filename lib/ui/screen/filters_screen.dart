import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var categoriesState = {
    'hotel': false,
    'restourant': false,
    'particular-place': false,
    'park': false,
    'museum': false,
    'cafe': false,
  };
  int indexOfSearchOption = 0;
  var searchOption = [100, 250, 500, 1000, 2000, 3000, 4000, 5000, 7500, 10000];
  var searchOptionDescription = [
    textContent['radius0'],
    textContent['radius1'],
    textContent['radius2'],
    textContent['radius3'],
    textContent['radius4'],
    textContent['radius5'],
    textContent['radius6'],
    textContent['radius7'],
    textContent['radius8'],
    textContent['radius9'],
  ];

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
              print('IconButton Back is pressed');
            }),
        actions: [
          TextButton(
              style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color>(),
                  //shape: MaterialStateProperty.all<RoundedRectangleBorder>()
                  ),
              child: Text(
                'Очистить',
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
              child: Text('КАТЕГОРИИ',
                  style: normal12.copyWith(
                      color: Theme.of(context).colorScheme.unselectedColor))),
          Row(
            children: [
              Expanded(child: CategoryButton('hotel', this)),
              Expanded(child: CategoryButton('restourant', this)),
              Expanded(child: CategoryButton('particular-place', this)),
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(child: CategoryButton('park', this)),
              Expanded(child: CategoryButton('museum', this)),
              Expanded(child: CategoryButton('cafe', this)),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 60),
              child: Row(
                children: [
                  Text('Расстояние', style: normal),
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
                      'ПОКАЗАТЬ',
                      style: normal.copyWith(color: Colors.white),
                    ),
                    onPressed: () {})),
          ))
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String name;
  var par;

  CategoryButton(this.name, this.par);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.cardBackgroundColor.withOpacity(1),
            shape: BoxShape.circle,
          ),

          child: Stack(children: [
            Center( child:

            IconButton(
                    icon: ImageIcon(
                      AssetImage('res/icons/catalog/' + name + '.png'),
                      color:
                          Theme.of(context).colorScheme.buttonBackgroundColor,
                        size: 32.0
                    ),
                    onPressed: () {
                      par.setState(() {
                        par.categoriesState[name] = !par.categoriesState[name];
                      });
                    })
                )
            ,
            Positioned(
                bottom: 0,
                right: 0,
                child: par.categoriesState[name]
                    ? Icon(Icons.check_circle, size: 16.0, color: Colors.black)
                    : SizedBox.shrink())
          ])),
      SizedBox(height: 12),
      Text(textContent[name], style: normal12),
    ]);
  }
}
