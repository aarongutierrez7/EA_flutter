import 'dart:convert';

FlatsResponseModel flatsResponseJson(String str) =>
    FlatsResponseModel.fromJson(json.decode(str));

class FlatsResponseModel {
  FlatsResponseModel({
    this.id,
    this.name,
    this.address,
    this.description,
    this.creator,
    this.price,
    this.lat,
    this.lng,
    this.V,
    this.picture,
  });
  late String? id;
  late String? name;
  late String? address;
  late String? description;
  late String? creator;
  late int? price;
  late num? lat;
  late num? lng;
  late int? V;
  late String? picture;

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
