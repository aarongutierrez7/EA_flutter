import 'package:flutter/material.dart';
import 'package:flutter_project/models/login_request_model.dart';
import 'package:flutter_project/models/login_response_model.dart';
import 'package:flutter_project/services/api_service.dart';

class LogInProvider extends ChangeNotifier {
  late LoginResponseModel user;
  String? email;
  String? psswrd;

  Future<LoginResponseModel> logInProvider() async {
    LoginRequestModel model = LoginRequestModel(
      email: email,
      password: psswrd,
    );
    user = await APIService.login(model);
    notifyListeners();
    return user;
  }
}
