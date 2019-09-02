import 'package:flutter/material.dart';

class Styles{
  static const double _textSizeHeader = 25.0;
  static const double _textSizeLarge = 20.0;
  static const double _textSizeMedium = 18.0;
  static const double _textSizeDefault = 16.0;

  static final Color _defaultColor = Colors.black;
  static final Color _gradeDisplayColor = Colors.purple;

  static final String _defaultFont = "Muli";

  static final navBarHeader = TextStyle(fontFamily: _defaultFont, fontSize: _textSizeHeader, color: _defaultColor);
  static final listTitle = TextStyle(fontFamily: _defaultFont, fontSize: _textSizeLarge, color: _defaultColor);
  static final defaultText = TextStyle(fontFamily: _defaultFont, fontSize: _textSizeDefault, color: _defaultColor);
  static final popUpText = TextStyle(fontFamily: _defaultFont, fontSize: _textSizeMedium, color: _defaultColor);
  static final classCardTitles = TextStyle(fontFamily: _defaultFont, fontSize: _textSizeHeader, color: _defaultColor);
  static final gradeDisplay = TextStyle(fontFamily: _defaultFont, fontSize: _textSizeHeader, color: _gradeDisplayColor);
}