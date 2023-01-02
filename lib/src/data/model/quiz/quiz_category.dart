class QuizCategoryModel {
  int? id;
  List<AddImages>? addImages;
  String? name;
  String? description;
  int? questionTime;
  bool? sendQuestion;
  bool? sendAnswer;
  String? reward;
  String? creator;
  int? category;
  int? offSet;

  QuizCategoryModel(
      {id,
      addImages,
      name,
      description,
      questionTime,
      sendQuestion,
      sendAnswer,
      reward,
      creator,
      category});

  QuizCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    creator = json['creator'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    if (addImages != null) {
      data['add_images'] = addImages!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['description'] = description;
    data['question_time'] = questionTime;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    data['reward'] = reward;
    data['creator'] = creator;
    data['category'] = category;
    return data;
  }
}

class AddImages {
  int? id;
  String? file;
  int? quiz;

  AddImages({id, file, quiz});

  AddImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['file'] = file;
    data['quiz'] = quiz;
    return data;
  }
}
