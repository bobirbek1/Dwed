class QuizQuestionModel {
  int? id;
  String? answers;
  String? text;
  int? type;
  int? quiz;
  int? offset;

  QuizQuestionModel({id, answers, text, type, quiz});

  QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answers = json['answers'];
    text = json['text'];
    type = json['type'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['answers'] = answers;
    data['text'] = text;
    data['type'] = type;
    data['quiz'] = quiz;
    return data;
  }
}