import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.name,
    required this.lastName,
    required this.email,
    required this.id,
    required this.token,
  });
  late final String name;
  late final String lastName;
  late final String email;
  late final String id;
  late final String token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}
