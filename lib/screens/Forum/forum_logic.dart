import 'dart:convert';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/API/answers_response_model.dart';
import 'package:flutter_project/models/API/question_response.dart';
import 'package:http/http.dart' as http;

class ForumService {
  static var client = http.Client();

  static Future<List<QuestionResponseModel>> getQuestions() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getQuestionsAPI,
    );
    print(url);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    Iterable l = json.decode(response.body);
    List<QuestionResponseModel> questions = List<QuestionResponseModel>.from(
        l.map((model) => QuestionResponseModel.fromJson(model)));

    return questions;
  }

  static Future<List<AnswersResponseModel>> getAnswers(String id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getAnswersAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    Iterable l = json.decode(response.body);
    List<AnswersResponseModel> answers = List<AnswersResponseModel>.from(
        l.map((model) => AnswersResponseModel.fromJson(model)));
    return answers;
  }

  static Future<bool> saveProduct(
    QuestionResponseModel model,
  ) async {
    var url = Uri.http(
      Config.apiURL,
      Config.getQuestionsAPI,
    );

    print(url);

    var response = await client.post(url, body: {
      "creator": "61acf094556c324e770253a4",
      "question": model.question,
      "subject": "61be1a1bfd30c314d7329e68"
    });

    /*var questionURL = Config.getQuestionsAPI;

    var url = Uri.http(Config.apiURL, questionURL);

    var requestMethod = "POST";

    var request = http.MultipartRequest(requestMethod, url);
    request.fields["creator"] = "61acf094556c324e770253a4";

    request.fields["question"] = model.question!;
    request.fields["subject"] = "61be1a1bfd30c314d7329e68";

    print(request);*/

    /*if (model.productImage != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'productImage',
        model.productImage!,
      );

      request.files.add(multipartFile);
    }*/

    //var response = await request.send();

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
