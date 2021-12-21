import 'dart:convert';

FlatsResponseModel flatsResponseJson(String str) =>
    FlatsResponseModel.fromJson(json.decode(str));

class FlatsResponseModel {
  FlatsResponseModel({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.creator,
    required this.price,
    required this.lat,
    required this.lng,
    required this.V,
    required this.picture,
  });
  late final String id;
  late final String name;
  late final String address;
  late final String description;
  late final String creator;
  late final int price;
  late final double lat;
  late final double lng;
  late final int V;
  late final String picture;

  FlatsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    creator = json['creator'];
    price = json['price'];
    lat = json['lat'];
    lng = json['lng'];
    V = json['__v'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['description'] = description;
    _data['creator'] = creator;
    _data['price'] = price;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['__v'] = V;
    _data['picture'] = picture;
    return _data;
  }

  static List<FlatsResponseModel> flatFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return FlatsResponseModel.fromJson(data);
    }).toList();
  }
}
