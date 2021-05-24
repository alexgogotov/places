import 'package:flutter/material.dart';

/// Стили текстов
TextStyle _textRoboto = const TextStyle(
      fontStyle: FontStyle.normal,
      fontFamily: "Roboto",
    ),
    title = _textRoboto.copyWith(fontSize: 24.0),
    normal = _textRoboto.copyWith(fontSize: 18.0),
    normalBlack = normal.copyWith(color: Colors.black),
    text = _textRoboto.copyWith(fontSize: 16.0),
    small = _textRoboto.copyWith(fontSize: 14.0),
    smallGreen = small.copyWith(color: Colors.green),
    smallBlueGrey = small.copyWith(color: Colors.blueGrey),
    smallGrey = small.copyWith(color: Colors.grey),
    smallBold = small.copyWith(fontWeight: FontWeight.bold),
    button = _textRoboto.copyWith(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
    largeTitle = _textRoboto.copyWith(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32.0);
