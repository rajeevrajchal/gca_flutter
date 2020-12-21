import 'package:flutter/material.dart';
import 'package:week_1/screens/index.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routes) {
    final dynamic args = routes.arguments;

    switch (routes.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/detail':
        return MaterialPageRoute(
            builder: (context) => (PostDetail(
                  post: args,
                )));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page Not Found'),
        ),
      );
    });
  }
}
