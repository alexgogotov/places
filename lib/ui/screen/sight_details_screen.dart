import 'package:flutter/material.dart';

class SightDetailsScreen extends StatefulWidget {
  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/8/85/Tour_Eiffel_Wikimedia_Commons_(cropped).jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 15),
                    alignment: Alignment.topLeft,
                    child: Text('Пряности и радости',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text('ресторан',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text('закрыто до 08:00', style: TextStyle(fontSize: 14))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 15),
                    child: Text(
                        'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного.',
                        style: TextStyle(fontSize: 14)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: IconButton(
                      icon: Row(children: [
                        Icon(
                          Icons.swap_calls,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ], mainAxisAlignment: MainAxisAlignment.center),
                      onPressed: () {
                        print('IconButton BuildRoute is pressed');
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Expanded(
                        child: IconButton(
                          icon: Row(children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'Запланировать',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
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
                            Icon(
                              Icons.favorite,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'В Избранное',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ], mainAxisAlignment: MainAxisAlignment.center),
                          onPressed: () {
                            print('IconButton Favorite is pressed');
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 16)),
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 16),
                onPressed: () {
                  print('IconButton Back is pressed');
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
