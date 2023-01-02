class QuestionListModel {
  int? id;
  List<Answers>? answers;
  int? index;
  String? text;
  int? type = 1;
  int? quiz;
  int? offset;

  QuestionListModel(
      {id, answers, index, text, type, quiz});

  QuestionListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add( Answers.fromJson(v));
      });
    }
    index = json['index'];
    text = json['text'];
    type = json['type'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['index'] = index;
    data['text'] = text;
    data['type'] = type;
    data['quiz'] = quiz;
    return data;
  }
}

class Answers {
  int? id;
  String? text;
  bool? correctAnswer;

  Answers({id, text, correctAnswer});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}