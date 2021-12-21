import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/login_response_model.dart';
import 'package:flutter_project/screens/menu_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class HomeScreen extends StatefulWidget {
  final LoginResponseModel res;

  const HomeScreen({
    Key? key,
    required this.res,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState(res);
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginResponseModel response;

  _HomeScreenState(this.response);
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      drawer: NavBar(
        user: response,
      ),
      appBar: AppBar(
        backgroundColor: HexColor("#007CC1"), //Color.fromRGBO(0, 124, 193, 0),
        title: Text(
          'NewStudent2',
          textAlign: TextAlign.center,
        ),
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
                          backgroundImage:
                              NetworkImage(widget.res.result.picture),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.res.result.name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(widget.res.result.lastName,
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
                                  'https://cdn-icons-png.flaticon.com/512/709/709579.png',
                                  fit: BoxFit.contain,
                                  height: 150,
                                ),
                              ),
                              Text(
                                'Profile',
                                style: cardTextStyle,
                              )
                            ],
                          ),
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
                                  'https://cdn-icons-png.flaticon.com/512/3820/3820102.png',
                                  height: 150,
                                ),
                              ),
                              Text(
                                'Forum',
                                style: cardTextStyle,
                              )
                            ],
                          ),
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
                                  'https://cdn-icons-png.flaticon.com/512/3534/3534065.png',
                                  height: 150,
                                ),
                              ),
                              Text(
                                'Lessons',
                                style: cardTextStyle,
                              )
                            ],
                          ),
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
                                  'https://cdn-icons.flaticon.com/png/512/3193/premium/3193015.png?token=exp=1640090819~hmac=2c9a41348c770cf7a3f35d0d19171048',
                                  height: 150,
                                ),
                              ),
                              Text(
                                'Chat',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.network(
                                'https://cdn-icons-png.flaticon.com/512/2286/2286105.png',
                                height: 150,
                              ),
                              Text(
                                'Housing',
                                style: cardTextStyle,
                              )
                            ],
                          ),
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
                                  'https://cdn-icons.flaticon.com/png/512/3183/premium/3183583.png?token=exp=1640090381~hmac=0daecf6cf7b79123ccf23600992956d9',
                                  height: 150,
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
}
