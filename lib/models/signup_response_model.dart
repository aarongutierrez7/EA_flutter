import 'dart:convert';

SignUpResponseModel signupResponseJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

class SignUpResponseModel {
  SignUpResponseModel({
    required this.name,
    required this.lastName,
    required this.email,
    required this.age,
    required this.id,
    required this.token,
  });
  late final String name;
  late final String lastName;
  late final String email;
  late final int age;
  late final String id;
  late final String token;

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    age = json['age'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['age'] = age;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}
