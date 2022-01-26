class QuestionResponseModel {
  QuestionResponseModel({
    this.id,
    this.creator,
    this.question,
    this.createdAt,
    this.subject,
    this.answers,
    this.V,
  });
  late String? id;
  late String? creator;
  late String? question;
  late String? createdAt;
  late String? subject;
  late List<Answers>? answers;
  late int? V;

  QuestionResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    creator = json['creator'];
    question = json['question'];
    createdAt = json['createdAt'];
    subject = json['subject'];
    answers =
        List.from(json['answers']).map((e) => Answers.fromJson(e)).toList();
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['creator'] = creator;
    _data['question'] = question;
    _data['createdAt'] = createdAt;
    _data['subject'] = subject;
    _data['answers'] = answers!.map((e) => e.toJson()).toList();
    _data['__v'] = V;
    return _data;
  }
}

class Answers {
  Answers({
    required this.id,
    required this.creator,
    required this.answer,
    required this.createdAt,
    required this.likes,
    required this.V,
    required this.likeCountNumber,
  });
  late final String id;
  late final String creator;
  late final String answer;
  late final String createdAt;
  late final List<String> likes;
  late final int V;
  late final int? likeCountNumber;

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    creator = json['creator'];
    answer = json['answer'];
    createdAt = json['createdAt'];
    likes = List.castFrom<dynamic, String>(json['likes']);
    V = json['__v'];
    likeCountNumber = json['likeCountNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['creator'] = creator;
    _data['answer'] = answer;
    _data['createdAt'] = createdAt;
    _data['likes'] = likes;
    _data['__v'] = V;
    _data['likeCountNumber'] = likeCountNumber;
    return _data;
  }
}
