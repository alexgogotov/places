import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_content.dart';

class SightDetailsScreen extends StatefulWidget {
  final Sight sight;

  SightDetailsScreen(this.sight);

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState(sight);
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  final Sight sight;

  _SightDetailsScreenState(this.sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 360,
                  child: Image.network(sight.url, fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  })),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text(sight.name, style: title),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(textByKeyCategory(sight.category),
                            style: smallBold.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .unselectedColor)),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text('закрыто до 08:00',
                            style: small.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .unselectedColor))
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 16, top: 15),
                    child: Text(sight.details, style: small),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 20),
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
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
                      child: Row(children: [
                        Image.asset("res/icons/go.png"),
                        SizedBox(width: 10),
                        Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: button.copyWith(
                              color: Theme.of(context).iconTheme.color),
                        )
                      ], mainAxisAlignment: MainAxisAlignment.center),
                      onPressed: () {
                        print('go button is pressed');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: IconButton(
                          icon: Row(children: [
                            ImageIcon(
                              AssetImage("res/icons/calendar.png"),
                              color:
                                  Theme.of(context).colorScheme.unselectedColor,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'Запланировать',
                              style: small.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .unselectedColor),
                            )
                          ], mainAxisAlignment: MainAxisAlignment.center),
                          onPressed: () {
                            print('IconButton Calendar is pressed');
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Row(children: [
                            ImageIcon(
                              AssetImage("res/icons/menu/heart.png"),
                              color:
                                  Theme.of(context).colorScheme.selectedColor,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'В Избранное',
                              style: small.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .selectedColor),
                            )
                          ], mainAxisAlignment: MainAxisAlignment.center),
                          onPressed: () {
                            print('IconButton Favorite is pressed');
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  )
                ],
              )
            ],
          ),
          Positioned(
            left: 16,
            top: 36,
            width: 32,
            height: 32,
            child: Container(
              padding: const EdgeInsets.only(left: 3.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 16),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            //IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {},)
          )
        ],
      ),
    );
  }
}
