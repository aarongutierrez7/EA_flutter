// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_project/models/API/answers_response_model.dart';
import 'package:flutter_project/models/API/question_response.dart';
import 'package:flutter_project/screens/Forum/forum_logic.dart';
import 'package:flutter_project/screens/SideBar/sidebar_UI.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  late List<QuestionResponseModel> _questions;
  late List<AnswersResponseModel> _answers;

  bool _isLoading = true;
  bool _moreAnswers = true;

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  Future<void> getQuestions() async {
    _questions = await ForumService.getQuestions();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            label: Text("Add Question"),
            onPressed: () {
              Navigator.of(context).pushNamed('/add-question');
            }),
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: HexColor("#1C3144"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.forum), SizedBox(width: 10), Text('Forum')],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.5,
                    child: ExpansionTile(
                      title: Text(_questions[index].question!),
                      children: getChildren(index),
                    ),
                  );
                },
              ));
  }

  List<Widget> getChildren(int ind) {
    List<Widget> ar = [];
    for (int i = 0; i < _questions[ind].answers!.length; i++) {
      ar.add(
        ListTile(
          title: Text(_questions[ind].answers![i].answer),
          trailing: Column(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 3),
              _questions[ind].answers![i].likes.isNotEmpty
                  ? Text(_questions[ind].answers![i].likes.length.toString())
                  : const Text("0")
            ],
          ),
        ),
      );
    }
    return ar;
  }
}
