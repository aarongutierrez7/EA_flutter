import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FlatsCard extends StatelessWidget {
  final String name;
  final String price;
  final String creator;
  final String picture;
  final String description;

  FlatsCard(
      {required this.name,
      required this.creator,
      required this.price,
      required this.picture,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            /*colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35),
                BlendMode.multiply,
              ),*/
            image: NetworkImage(picture),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.monetization_on_sharp,
                          color: Colors.green,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(
                          price,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(
                          creator,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
      //SizedBox(height: 1),
      /*Align(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      //backgroundColor: Colors.black,
                      color: Colors.blueAccent),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        alignment: Alignment.center,
      ),*/
      //SizedBox(height: 3),
      Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              //margin: EdgeInsets.symmetric(horizontal: 22, vertical: 1),
              width: double.infinity, //MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border(
                    top: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                        style: BorderStyle.solid)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(description),
              ),
            ),
          ),
          Center(
            child: Positioned(
                child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
              color: Colors.white,
              child: Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 17),
              ),
            )),
          ),
          SizedBox(height: 50),
        ],
      )
    ]);
  }
}
