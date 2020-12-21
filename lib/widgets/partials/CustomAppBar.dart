import 'package:flutter/material.dart';
import 'package:week_1/styles/palette.dart';
import 'package:week_1/styles/vars.dart';

Widget customAppBar(String appBarTitle) => AppBar(
      brightness: Brightness.light,
      backgroundColor: Palette.primary,
      elevation: 0.0,
      automaticallyImplyLeading: true,
      centerTitle: false,
      title: Text(
        appBarTitle,
        style: TextStyle(
            color: Palette.light,
            fontSize: Font.md,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          color: Palette.light,
          icon: Icon(Icons.person),
        ),
        IconButton(
          onPressed: () {},
          color: Palette.light,
          icon: Icon(Icons.messenger),
        )
      ],
    );
