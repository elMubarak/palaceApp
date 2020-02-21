import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false,String titleText}) {
  return AppBar(
    title: Text(
   isAppTitle ? 'Palace':titleText,
      style: TextStyle(
        fontFamily: isAppTitle ?'Lato':'',
        fontSize: isAppTitle ? 20 : 15.0,
      ),
    ),
    backgroundColor: Theme.of(context).accentColor,
  );
}
