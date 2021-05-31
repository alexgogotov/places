import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';


class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 119,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SightCard(mocks[0]),
              SightCard(mocks[1]),
              SightCard(mocks[2])
            ],
          ),
        ));
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Container(
          width: double.infinity,
          height: 72,
          margin: EdgeInsets.only(top: 14),
          child: Text(
            'Список\nинтересных мест',
            maxLines: 2,
            style: largeTitle.copyWith(color: Theme.of(context).colorScheme.titleColor),
          ),
        ),
        toolbarHeight: height,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        titleSpacing: 16);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
