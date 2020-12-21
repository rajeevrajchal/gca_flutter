import 'package:flutter/material.dart';
import 'package:week_1/components/index.dart';
import 'package:week_1/styles/palette.dart';
import 'package:week_1/widgets/index.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: customAppBar("GCA"),
      body: Container(
        child: PostList(),
      ),
    );
  }
}
