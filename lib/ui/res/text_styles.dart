import 'package:flutter/material.dart';

/// Стили текстов
TextStyle _textRoboto = const TextStyle(
      fontStyle: FontStyle.normal,
      fontFamily: "Roboto",
    ),
    title = _textRoboto.copyWith(fontSize: 24.0),
    normal = _textRoboto.copyWith(fontSize: 18.0),
    normal12 = _textRoboto.copyWith(fontSize: 12.0),
    text = _textRoboto.copyWith(fontSize: 16.0),
    small = _textRoboto.copyWith(fontSize: 14.0),
    smallBold = small.copyWith(fontWeight: FontWeight.bold),
    button = _textRoboto.copyWith(
        fontSize: 14, fontWeight: FontWeight.bold),
    largeTitle = _textRoboto.copyWith(
        fontWeight: FontWeight.bold, fontSize: 32.0);
