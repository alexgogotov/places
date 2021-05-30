import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/res/themes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: darkTheme,
      //theme: lightTheme,
      //home: SightListScreen(),
      //home: SightDetailsScreen(),
      home: VisitingScreen(),
    );
  }
}
