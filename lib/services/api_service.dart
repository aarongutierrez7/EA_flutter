import 'dart:convert';
import 'package:flutter_project/config.dart';
import 'package:flutter_project/models/login_request_model.dart';
import 'package:flutter_project/models/login_response_model.dart';
import 'package:flutter_project/models/signup_request_model.dart';
import 'package:flutter_project/models/signup_response_model.dart';
import 'package:flutter_project/services/shared_services.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.loginAPI,
    );
    print("Peticio login");

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      print(response.statusCode);

      return true;
    } else {
      return false;
    }
  }

  static Future<SignUpResponseModel> register(
    SignUpResponseModel model,
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
}
