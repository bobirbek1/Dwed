class NewQuestionModel {
  List<AddAnswers>? addAnswers;
  String? text;
  int? type;

  NewQuestionModel({this.addAnswers, this.text, this.type});

  NewQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['add_answers'] != null) {
      addAnswers = <AddAnswers>[];
      json['add_answers'].forEach((v) {
        addAnswers!.add( AddAnswers.fromJson(v));
      });
    }
    text = json['text'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (addAnswers != null) {
      data['add_answers'] = addAnswers!.map((v) => v.toJson()).toList();
    }
    data['text'] = text;
    data['type'] = type;
    return data;
  }
}

class AddAnswers {
  int? id;
  String? text;
  bool? correctAnswer;

  AddAnswers({this.id, this.text, this.correctAnswer});

  AddAnswers.fromJson(Map<String, dynamic> json) {
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