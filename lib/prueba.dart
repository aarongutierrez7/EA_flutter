import 'package:flutter/material.dart';
import 'package:flutter_project/providers/google_signin_provider.dart';
import 'package:flutter_project/screens/SideBar/sidebar_UI.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class PruebaScreen extends StatefulWidget {
  const PruebaScreen({Key? key}) : super(key: key);

  @override
  _PruebaScreenState createState() => _PruebaScreenState();
}

class _PruebaScreenState extends State<PruebaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: HexColor("#1C3144"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.forum), SizedBox(width: 10), Text('Forum')],
          ),
          actions: [
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            )
          ],
        ),
        body: const Center(child: Text("Estamos dentro!!!")));
  }
}
