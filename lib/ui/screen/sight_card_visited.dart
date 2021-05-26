import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';

class SightCardVisited extends StatelessWidget {
  final Sight sight;

  SightCardVisited(this.sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetUp(sight.url),
        WidgetDown(sight.name, sight.comment, sight.hours),
      ],
    );
  }
}

class WidgetUp extends StatelessWidget {
  final String url;

  WidgetUp(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 96,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: [
            Positioned(
              top: 19,
              right: 18,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 19,
              right: 56,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}

class WidgetDown extends StatelessWidget {
  final String name, comment, hours;

  WidgetDown(this.name, this.comment, this.hours);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 2),
                child: Text(
                  name,
                  style: text,
                )),
            Container(
                height: 28,
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 2),
                child: Text(
                  comment,
                  style: smallBlueGrey,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Text(
                  hours,
                  style: smallBlueGrey,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ));
  }
}
