import 'dart:convert';

SignUpRequestModel signupRequestJson(String str) =>
    SignUpRequestModel.fromJson(json.decode(str));

class SignUpRequestModel {
  SignUpRequestModel({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.picture,
    required this.subjects,
  });
  late final String name;
  late final String lastName;
  late final String email;
  late final String password;
  late final String picture;
  late final List<String> subjects;

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    picture = json['picture'];
    subjects = List.castFrom<dynamic, String>(json['subjects']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['picture'] = picture;
    _data['subjects'] = subjects;
    return _data;
  }
}
