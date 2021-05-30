import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/themes.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 2,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 96,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                    image: DecorationImage(
                      image: NetworkImage(sight.url),
                      fit: BoxFit.cover,
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      top: 19,
                      right: 18,
                      child: Container(
                        width: 20,
                        height: 18,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )),
            Container(
                width: double.infinity,
                height: 92,
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                          style: text.copyWith(color: Theme.of(context).colorScheme.titleColor),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          sight.details,
                          style: small.copyWith(color: Theme.of(context).colorScheme.unselectedColor),
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                )),
          ],
        ));
  }
}
