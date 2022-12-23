class UserQuizModel {
  List<AddImages>? addImages;
  String? name;
  String? description;
  int? questionTime;
  bool? sendQuestion;
  bool? sendAnswer;
  String? reward;
  int? category;

  UserQuizModel(
      {addImages,
        name,
        description,
        questionTime,
        sendQuestion,
        sendAnswer,
        reward,
        category});

  UserQuizModel.fromJson(Map<String, dynamic> json) {
    if (json['add_images'] != null) {
      addImages = <AddImages>[];
      json['add_images'].forEach((v) {
        addImages!.add( AddImages.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'];
    questionTime = json['question_time'];
    sendQuestion = json['send_question'];
    sendAnswer = json['send_answer'];
    reward = json['reward'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (addImages != null) {
      data['add_images'] = addImages!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['description'] = description;
    data['question_time'] = questionTime;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    data['reward'] = reward;
    data['category'] = category;
    return data;
  }
}

class AddImages {
  String? file;

  AddImages({file});

  AddImages.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['file'] = file;
    return data;
  }
}

