import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/API/login_request_model.dart';
import 'package:flutter_project/models/API/login_response_model.dart';
import 'package:flutter_project/models/Data/user_model.dart';
import 'package:flutter_project/screens/save_user.dart';
import 'package:flutter_project/services/shared_services.dart';
import 'package:http/http.dart' as http;

class LoginService {
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

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      /*await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );*/
      guardarUsuario(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static void guardarUsuario(LoginResponseModel u) {
    final UserData usuario = UserData(
      id: u.result.id,
      name: u.result.name,
      lastName: u.result.lastName,
      email: u.result.email,
      password: u.result.password,
      picture: u.result.picture ??
          "https://res.cloudinary.com/sergiogras/image/upload/v1638723726/mxko94qfnaqkiouz0ekg.jpg",
      subjects: u.result.subjects,
    );

    currentUser = usuario;
  }
}
