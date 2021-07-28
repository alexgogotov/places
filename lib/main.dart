import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(App());
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyAppTheme(isLightTheme: true),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: Provider.of<MyAppTheme>(context).isLightTheme
          ? lightTheme
          : darkTheme,
      home: SightListScreen(),
      //home: SightDetailsScreen(),
      //home: VisitingScreen(),
      //home: FiltersScreen(),
      //home: SettingsScreen(),
      //home: AddSightScreen(),
    );
  }
}
