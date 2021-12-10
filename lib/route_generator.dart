// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/signup_screen.dart';
import 'package:flutter_project/screens/menu_screen.dart';
import 'package:flutter_project/screens/dashboard_screen.dart';

//import 'package:routing_prep/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => LogInScreen());
      case '/signup':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/sidebar':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => NavBar());
      case '/dashboard':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => HomeScreen());

      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      //return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
