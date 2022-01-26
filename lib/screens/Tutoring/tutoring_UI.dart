// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/API/tutoring_response_model.dart';
import 'package:flutter_project/screens/SideBar/sidebar_UI.dart';
import 'package:flutter_project/screens/Tutoring/tutoring_logic.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({Key? key}) : super(key: key);

  @override
  _LessonsScreenState createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late List<TutoringResponseModel> _lessons;
  bool _isLoading = true;

  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  Future<void> getLessonsList() async {
    _lessons = await TutoringService.getLessons();
    setState(() {
      _isLoading = false;
    });

    List<Widget> listItems = [];
    for (int i = 0; i < _lessons.length; i++) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _lessons[i].subject,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      if (_lessons[i].description.length <= 24)
                        Text(
                          _lessons[i].description,
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        )
                      else if (_lessons[i].description.length > 24)
                        Text(
                          _lessons[i].description.substring(0, 25) +
                              '\n' +
                              _lessons[i].description.substring(
                                  25, _lessons[i].description.length),
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${_lessons[i].price}",
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(_lessons[i].picture),
                      ),
                      SizedBox(height: 3),
                      Text(_lessons[i].creatorName,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          )));
    }

    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getLessonsList();
    controller.addListener(() {
      double value = controller.offset / 200;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: NavBar(),
        appBar: AppBar(
          elevation: 2,
          backgroundColor: HexColor("#1C3144"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu_book_sharp),
              SizedBox(width: 10),
              Text('Lessons')
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: closeTopContainer ? 0 : 1,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          width: size.width,
                          alignment: Alignment.topCenter,
                          height: closeTopContainer ? 0 : categoryHeight,
                          child: categoriesScroller),
                    ),
                    Expanded(
                        child: ListView.builder(
                            controller: controller,
                            itemCount: itemsData.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              double scale = 1.0;
                              if (topContainer > 0.5) {
                                scale = index + 0.5 - topContainer;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
                              return Opacity(
                                opacity: scale,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..scale(scale, scale),
                                  alignment: Alignment.bottomCenter,
                                  child: Align(
                                      heightFactor: 1,
                                      alignment: Alignment.topCenter,
                                      child: itemsData[index]),
                                ),
                              );
                            })),
                  ],
                ),
              ),
      ),
    );
  }
}

class CategoriesScroller extends StatefulWidget {
  const CategoriesScroller();

  @override
  State<CategoriesScroller> createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  List<Widget> itemsCategories = [];

  late List<TutoringResponseModel> _categories;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategories();

    //print(itemsCategories.isEmpty);
    //print(_isLoading);
  }

  Future<void> getCategories() async {
    _categories = await TutoringService.getLessons();
    setState(() {
      _isLoading = false;
    });

    List<Widget> listItems = [];
    for (int i = 0; i < _categories.length; i++) {
      listItems.add(Align(
        child: Container(
          height: 150,
          width: 150,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.orange.shade400,
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Text(
                      _categories[i].subject,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ));
    }

    setState(() {
      itemsCategories = listItems;
      print(itemsCategories.isEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: itemsCategories,
    );
  }
}
