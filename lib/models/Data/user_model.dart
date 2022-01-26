import 'package:flutter/material.dart';

class UserData {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  late final String? picture;
  final List<dynamic> subjects;

  //UserData(this.id, this.name, this.password, this.email, this.name, this.subjects, this.descripcion, this.imageUrl, this.puntuacion);

  UserData({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.picture,
    required this.subjects,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      password: json['password'],
      email: json['email'],
      picture: json['picture'],
      subjects: json['subjects'],
    );
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
    return _data;
  }
}
