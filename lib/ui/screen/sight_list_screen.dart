import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/mocks.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            width: double.infinity,
            height: 72,
            margin: EdgeInsets.only(top: 14),
            child: Text(
              'Список\nинтересных мест',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
            ),
          ),
          toolbarHeight: 119,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          titleSpacing: 16),

      body: SingleChildScrollView(
        child: Column(children: [
          SightCard(mocks[0]),
          SightCard(mocks[1]),
          SightCard(mocks[2])
        ],),
      )
    );
  }
}
