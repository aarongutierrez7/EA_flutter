// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_project/models/API/login_response_model.dart';
import 'package:flutter_project/providers/google_signin_provider.dart';
import 'package:flutter_project/screens/Dashboard/dashboard_UI.dart';
import 'package:flutter_project/screens/save_user.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(currentUser.name),
            accountEmail: Text(currentUser.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: HexColor("#1C3144"),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(currentUser.picture!),
              ),
            ),
            decoration: BoxDecoration(
              color: HexColor("#1C3144"),
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ))),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Forum'),
            onTap: () => Navigator.of(context).pushNamed('/forum'),
          ),
          ListTile(
            leading: Icon(Icons.menu_book_sharp),
            title: Text('Lessons'),
            onTap: () => Navigator.of(context).pushNamed('/lessons'),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          ListTile(
              leading: Icon(Icons.bedroom_child_outlined),
              title: Text('Housing'),
              onTap: () => Navigator.of(context).pushNamed(
                    '/flats',
                  )),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Teachers'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.of(context).pushNamed('/login');
              }),
        ],
      ),
    );
  }
}
