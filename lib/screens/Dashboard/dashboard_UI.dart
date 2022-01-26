// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/API/login_response_model.dart';
import 'package:flutter_project/models/Data/user_model.dart';
import 'package:flutter_project/providers/google_signin_provider.dart';
import 'package:flutter_project/screens/SideBar/sidebar_UI.dart';
import 'package:flutter_project/screens/save_user.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      guardarUsuarioGoogle(user);
    }

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      backgroundColor: HexColor("#1C3144"),
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: HexColor("#1C3144"), //Color.fromRGBO(0, 124, 193, 0),
        title: Text(
          'NewStudent',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
              Navigator.of(context).pushNamed('/login');
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/profile-bg3.jpg')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(currentUser.picture!),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              currentUser.name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(currentUser.lastName,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black))
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/profile'),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/709/709579.png',
                                    fit: BoxFit.contain,
                                    height: 100,
                                  ),
                                ),
                                Text(
                                  'Profile',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/forum'),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/3820/3820102.png',
                                    height: 100,
                                  ),
                                ),
                                Text(
                                  'Forum',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/lessons'),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/3534/3534065.png',
                                    height: 100,
                                  ),
                                ),
                                Text(
                                  'Lessons',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/589/589708.png',
                                    height: 100,
                                  ),
                                ),
                                Text(
                                  'Chat',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/flats'),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/2286/2286105.png',
                                    height: 110,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 25)),
                                  Text(
                                    'Housing',
                                    style: cardTextStyle,
                                  ),
                                ],
                              )),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/538/538899.png',
                                  height: 100,
                                ),
                              ),
                              Text(
                                'Teachers',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void guardarUsuarioGoogle(User u) {
    final UserData usuario = UserData(
      id: u.uid,
      name: u.displayName!,
      lastName: "",
      email: u.email!,
      password: "",
      picture: u.photoURL!,
      subjects: List.empty(),
    );

    currentUser = usuario;
  }
}
