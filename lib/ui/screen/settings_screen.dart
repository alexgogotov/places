import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Настройки',
            style: normal.copyWith(
                color: Theme.of(context).colorScheme.titleColor),
          )),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Column(children: [
          Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 38),
              child: Row(children: [
            Text('Темная тема', style: normal),
            Expanded(child: SizedBox.shrink()),
            Switch(
              value: !Provider.of<myAppTheme>(context).isLightTheme,
              onChanged: (value) {
                setState(() {
                  Provider.of<myAppTheme>(context, listen: false).changeTheme();
                });
              },
              activeColor: Theme.of(context).colorScheme.buttonBackgroundColor,
            )
          ])),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(children: [
            Text('Смотреть туториал', style: normal),
            Expanded(child: SizedBox.shrink()),
            IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.buttonBackgroundColor,
                ),
                onPressed: () {
                  print('IconButton Back is pressed');
                })
          ])),
        ]),
        bottomNavigationBar: BottomNavigationBar(currentIndex: 3, items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/list.png")),
              title: Text('')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/map.png")),
              title: Text('')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/heart-fill.png")),
              title: Text('')),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("res/icons/menu/settings-fill.png")),
              title: Text('')),
        ]));
  }
}
