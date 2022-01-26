// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/models/API/login_response_model.dart';
import 'package:flutter_project/prueba.dart';
import 'package:flutter_project/screens/Flats/flats_UI.dart';
import 'package:flutter_project/screens/Flats/flats_add.dart';
import 'package:flutter_project/screens/Forum/forum_UI.dart';
import 'package:flutter_project/screens/Forum/forum_add_question.dart';
import 'package:flutter_project/screens/Login/login_UI.dart';
import 'package:flutter_project/screens/Login/login_home.dart';
import 'package:flutter_project/screens/Profile/profile_UI.dart';
import 'package:flutter_project/screens/Signup/signup_UI.dart';
import 'package:flutter_project/screens/SideBar/sidebar_UI.dart';
import 'package:flutter_project/screens/Dashboard/dashboard_UI.dart';
import 'package:flutter_project/screens/Tutoring/tutoring_UI.dart';

//import 'package:routing_prep/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => LoginHome());
      case '/signup':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/flats':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => FlatsScreen());
      case '/lessons':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => LessonsScreen());
      case '/forum':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => ForumScreen());
      case '/add-question':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => QuestionAdd());
      case '/add-flats':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => FlatsAdd());
      case '/profile':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => EditProfilePage());
      /*case '/sidebar':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => NavBar(user: null,));*/
      case '/dashboard':
        // Validation of correct data type
        if (args is LoginResponseModel) {
          return MaterialPageRoute(
            builder: (_) => DashboardScreen(),
          );
        }
        return _errorRoute();

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
