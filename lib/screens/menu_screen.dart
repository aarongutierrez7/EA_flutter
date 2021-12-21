import 'package:flutter/material.dart';
import 'package:flutter_project/models/login_response_model.dart';

class NavBar extends StatefulWidget {
  final LoginResponseModel user;
  const NavBar({Key? key, required this.user}) : super(key: key);
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
            accountName: Text(widget.user.result.name),
            accountEmail: Text(widget.user.result.email),
            currentAccountPicture: CircleAvatar(
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(widget.user.result.picture),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/profile-bg3.jpg")),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Forum'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          ListTile(
            leading: Icon(Icons.bedroom_child_outlined),
            title: Text('Housing'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Teachers'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
