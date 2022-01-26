import 'dart:convert';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/API/flats_response_model.dart';
import 'package:flutter_project/screens/save_user.dart';
import 'package:http/http.dart' as http;

class FlatsService {
  static var client = http.Client();

  static Future<List<FlatsResponseModel>> getFlats() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getFlatsAPI,
    );
    print(url);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    Iterable l = json.decode(response.body);
    List<FlatsResponseModel> flats = List<FlatsResponseModel>.from(
        l.map((model) => FlatsResponseModel.fromJson(model)));
    return flats;
  }

  static Future<bool> saveProduct(
    FlatsResponseModel model,
    bool isEditMode,
    bool isFileSelected,
  ) async {
    var url = Uri.http(
      Config.apiURL,
      Config.getFlatsAPI,
    );

    print(url);

    var response = await client.post(url, body: {
      "creator": currentUser.name,
      "name": model.name!,
      "address": model.address!,
      "lat": 41.562097.toString(),
      "lng": 2.001552.toString(),
      "description": model.description!,
      "price": model.price!.toString(),
      "picture": model.picture
    });

    // var productURL = Config.getFlatsAPI;

    // var url = Uri.http(Config.apiURL, productURL);

    // var request = http.MultipartRequest("PUT", url);

    /* if (model.picture != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'picture',
        model.picture!,
      );

      request.files.add(multipartFile);
    }
    print(request);
    var response = await request.send();*/

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
