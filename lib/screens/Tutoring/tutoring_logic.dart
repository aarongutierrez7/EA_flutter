import 'dart:convert';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/API/tutoring_response_model.dart';
import 'package:http/http.dart' as http;

class TutoringService {
  static var client = http.Client();

  static Future<List<TutoringResponseModel>> getLessons() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getLessons,
    );
    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    Iterable l = json.decode(response.body);
    List<TutoringResponseModel> lessons = List<TutoringResponseModel>.from(
        l.map((model) => TutoringResponseModel.fromJson(model)));
    return lessons;
  }
}
