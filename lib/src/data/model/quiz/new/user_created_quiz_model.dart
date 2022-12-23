class UserCreatedQuizModel {
  int? id;
  Images? images;
  int? questionNumber;
  Category? category;
  int? sessionNumber;
  String? name;
  String? description;
  int? questionTime;
  bool? sendQuestion;
  bool? sendAnswer;
  String? reward;
  String? creator;
  int? nextOffset;

  UserCreatedQuizModel(
      {id,
        images,
        questionNumber,
        category,
        sessionNumber,
        name,
        description,
        questionTime,
        sendQuestion,
        sendAnswer,
        reward,
        creator});

  UserCreatedQuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images =
    json['images'] != null ?  Images.fromJson(json['images']) : null;
    questionNumber = json['question_number'];
    category = json['category'] != null
        ?  Category.fromJson(json['category'])
        : null;
    sessionNumber = json['session_number'];
    name = json['name'];
    description = json['description'];
    questionTime = json['question_time'];
    sendQuestion = json['send_question'];
    sendAnswer = json['send_answer'];
    reward = json['reward'];
    creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['question_number'] = questionNumber;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['session_number'] = sessionNumber;
    data['name'] = name;
    data['description'] = description;
    data['question_time'] = questionTime;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    data['reward'] = reward;
    data['creator'] = creator;
    return data;
  }
}

class Images {
  int? id;
  String? file;
  int? quiz;

  Images({id, file, quiz});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['file'] = file;
    data['quiz'] = quiz;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  int? status;

  Category({id, name, image, status});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}

