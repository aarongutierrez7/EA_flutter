import 'dart:convert';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/answers_response_model.dart';
import 'package:flutter_project/models/flats_response_model.dart';
import 'package:flutter_project/models/login_request_model.dart';
import 'package:flutter_project/models/login_response_model.dart';
import 'package:flutter_project/models/questions_response_model.dart';
import 'package:flutter_project/models/signup_request_model.dart';
import 'package:flutter_project/models/signup_response_model.dart';
import 'package:flutter_project/services/shared_services.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.loginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      /*await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );*/

      return loginResponseJson(response.body);
    } else {
      return loginResponseJson("");
    }
  }

  static Future<SignUpResponseModel> register(
    SignUpRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.signupAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return signupResponseJson(
      response.body,
    );
  }

  static Future<List<FlatsResponseModel>> getFlats() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getFlatsAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    print(response.statusCode);
    print(response.body);
    Iterable l = json.decode(response.body);
    List<FlatsResponseModel> flats = List<FlatsResponseModel>.from(
        l.map((model) => FlatsResponseModel.fromJson(model)));
    return flats;
  }

  static Future<List<QuestionsResponseModel>> getQuestions() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getQuestionsAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    Iterable l = json.decode(response.body);
    List<QuestionsResponseModel> questions = List<QuestionsResponseModel>.from(
        l.map((model) => QuestionsResponseModel.fromJson(model)));
    return questions;
  }

  static Future<List<AnswersResponseModel>> getAnswers() async {
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
}
