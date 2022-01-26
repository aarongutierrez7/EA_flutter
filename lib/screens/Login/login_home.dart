import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/Dashboard/dashboard_UI.dart';
import 'package:flutter_project/screens/Login/login_UI.dart';

import '../../prueba.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return DashboardScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something Went Wrong!'),
            );
          } else {
            return LogInScreen();
          }
        },
      ));
}
