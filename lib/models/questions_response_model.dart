class QuestionsResponseModel {
  QuestionsResponseModel({
    required this.id,
    required this.creator,
    required this.question,
    required this.createdAt,
    required this.subject,
    required this.answers,
    required this.V,
  });
  late final String id;
  late final String creator;
  late final String question;
  late final String createdAt;
  late final String subject;
  late final List<String> answers;
  late final int V;

  QuestionsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    creator = json['creator'];
    question = json['question'];
    createdAt = json['createdAt'];
    subject = json['subject'];
    answers = List.castFrom<dynamic, String>(json['answers']);
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['creator'] = creator;
    _data['question'] = question;
    _data['createdAt'] = createdAt;
    _data['subject'] = subject;
    _data['answers'] = answers;
    _data['__v'] = V;
    return _data;
  }
}
