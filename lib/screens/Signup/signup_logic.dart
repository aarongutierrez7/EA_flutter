import 'dart:convert';

import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/API/signup_request_model.dart';
import 'package:flutter_project/models/API/signup_response_model.dart';
import 'package:flutter_project/services/shared_services.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  static var client = http.Client();

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
}
