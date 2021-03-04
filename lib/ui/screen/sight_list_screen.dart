import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          /*title: Text(
            'Список\nинтересных мест',
            maxLines: 2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 140,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0),*/
          title: RichText(
            text: TextSpan(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(children: [
                  TextSpan(text: 'С', style: TextStyle(color: Colors.green)),
                  TextSpan(text: 'писок')
                ]),
                TextSpan(children: [
                  TextSpan(text: '\nи', style: TextStyle(color: Colors.yellow)),
                  TextSpan(text: 'нтересных мест')
                ])
              ],
            ),
            maxLines: 2,
          ),
          toolbarHeight: 140,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0),
    );
  }
}
