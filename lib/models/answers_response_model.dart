class AnswersResponseModel {
  AnswersResponseModel({
    required this.id,
    required this.creator,
    required this.answer,
    required this.createdAt,
    required this.likeCountNumber,
    required this.V,
  });
  late final String id;
  late final String creator;
  late final String answer;
  late final String createdAt;
  late final int likeCountNumber;
  late final int V;

  AnswersResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    creator = json['creator'];
    answer = json['answer'];
    createdAt = json['createdAt'];
    likeCountNumber = json['likeCountNumber'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['creator'] = creator;
    _data['answer'] = answer;
    _data['createdAt'] = createdAt;
    _data['likeCountNumber'] = likeCountNumber;
    _data['__v'] = V;
    return _data;
  }
}
