import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      //home: SightListScreen(),
      //home: SightDetailsScreen(),
      home: VisitingScreen(),
    );
  }
}
