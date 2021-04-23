import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/res/text_styles1.dart';

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
            decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
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
                color: Colors.white70,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  left: 16,
                  child: Text(
                    sight.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                Positioned(
                  top: 58,
                  left: 16,
                  child: Container(
                      width: 296,
                      height: 18,
                      child: Text(
                        sight.details,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                        ),
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
              ],
            )),
      ],
    );
  }
}
