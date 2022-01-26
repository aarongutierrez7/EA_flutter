import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/global/route_generator.dart';
import 'package:flutter_project/providers/google_signin_provider.dart';
import 'package:flutter_project/prueba.dart';
import 'package:flutter_project/screens/Login/login_UI.dart';
import 'package:flutter_project/screens/Login/login_home.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'NewStudent',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // ignore: prefer_const_constructors
        home: PruebaScreen(),
      ));
}
