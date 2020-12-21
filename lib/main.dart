import 'package:flutter/material.dart';
import 'routes/index.dart';
import 'screens/index.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      onGenerateRoute: Routes.generateRoute));
}
