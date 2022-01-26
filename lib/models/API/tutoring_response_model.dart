import 'dart:convert';

class TutoringResponseModel {
  TutoringResponseModel({
    required this.id,
    required this.creatorName,
    required this.subject,
    required this.description,
    required this.picture,
    required this.price,
    required this.creatorId,
    required this.V,
  });
  late final String id;
  late final String creatorName;
  late final String subject;
  late final String description;
  late final String picture;
  late final int price;
  late final String creatorId;
  late final int V;

  TutoringResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    creatorName = json['creatorName'];
    subject = json['subject'];
    description = json['description'];
    picture = json['picture'];
    price = json['price'];
    creatorId = json['creatorId'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['creatorName'] = creatorName;
    _data['subject'] = subject;
    _data['description'] = description;
    _data['picture'] = picture;
    _data['price'] = price;
    _data['creatorId'] = creatorId;
    _data['__v'] = V;
    return _data;
  }

  static List<TutoringResponseModel> flatFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return TutoringResponseModel.fromJson(data);
    }).toList();
  }
}
