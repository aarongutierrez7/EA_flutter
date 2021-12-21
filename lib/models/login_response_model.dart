import 'dart:convert';
import 'package:flutter/material.dart';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.result,
    required this.token,
  });
  late final Result result;
  late final String token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['result']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Result with ChangeNotifier {
  Result({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.picture,
    required this.subjects,
    required this.V,
  });
  late final String id;
  late final String name;
  late final String lastName;
  late final String email;
  late final String password;
  late final String picture;
  late final List<dynamic> subjects;
  late final int V;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    picture = json['picture'];
    subjects = List.castFrom<dynamic, dynamic>(json['subjects']);
    V = json['__v'];
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['picture'] = picture;
    _data['subjects'] = subjects;
    _data['__v'] = V;
    return _data;
  }
}
