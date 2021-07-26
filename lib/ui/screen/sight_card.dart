import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/res/text_content.dart';
import 'package:places/ui/screen/sight_details_screen.dart';


class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 96,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Ink(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        image: DecorationImage(
                          image: NetworkImage(sight.url),
                          fit: BoxFit.cover,
                        )),
                    child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {
                          print('tap image');
                        })),
                Positioned(
                    top: 6,
                    right: 6,
                    child: IconButton(
                      icon: ImageIcon(AssetImage("res/icons/menu/heart.png")),
                      onPressed: () {
                        print('IconButton heart is pressed');
                      },
                    ))
              ],
            )),
        Container(
            width: double.infinity,
            height: 92,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.cardBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Text(
                      sight.name,
                      style: text.copyWith(
                          color: Theme.of(context).colorScheme.titleColor),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      sight.details,
                      style: small.copyWith(
                          color: Theme.of(context).colorScheme.unselectedColor),
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            )),
      ],
    );
  }
}

class SightCardSearch extends StatelessWidget {
  final Sight sight;

  SightCardSearch(this.sight);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: 56,
          height: 56,
          margin: EdgeInsets.only(left: 16, top: 22),
          child: Ink(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(sight.url),
                    fit: BoxFit.cover,
                  )),
              child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SightDetailsScreen(
                              sight)),
                    );
                  }))),
      SizedBox(width:16),
      Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height:22), Text(sight.name, style: text), SizedBox(height:8), Text(textByKeyCategory(sight.category),
          style: small.copyWith(
              color: Theme.of(context).colorScheme.unselectedColor)
          )])
    ]);
  }
}
