import 'package:flutter/material.dart';
import 'package:flutter_project/models/answers_response_model.dart';
import 'package:flutter_project/models/questions_response_model.dart';
import 'package:flutter_project/services/api_service.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  late List<QuestionsResponseModel> _questions;
  late List<AnswersResponseModel> _answers;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getFlats();
  }

  Future<void> getFlats() async {
    _questions = await APIService.getQuestions();
    _answers = await APIService.getAnswers();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  return ListTile(
                      title: Text(_questions[index].question),
                      subtitle: Text(_answers[index].answer));
                },
              ));
  }
}
