import 'package:equatable/equatable.dart';

class UserQuizResponseModel extends Equatable{
  int? id;
  int? questionNumber;
  bool? sendQuestion;
  bool? sendAnswer;
  String? name;
  String? description;
  int? questionTime;
  String? reward;
  String? creator;
  int? category;
  int? nextOffset;
  int? type;

  ///added
  int? expectedParticipant;
  int? timeLimit;


  UserQuizResponseModel(
      {this.id,
        addImages,
        this.questionNumber,
        this.name,
        this.description,
        this.questionTime,
        this.sendQuestion,
        this.sendAnswer,
        this.reward,
        this.creator,
        this.category});

  UserQuizResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionNumber = json['question_number'];
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
    data['question_number'] = questionNumber;
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

  @override
  List<Object?> get props => [id,
    questionNumber,
    name,
    description,
    questionTime,
    sendQuestion,
    sendAnswer,
    reward,
    creator,
    category];
}

class AddImages {
  int? id;
  String? file;
  int? quiz;

  AddImages({this.id, this.file, this.quiz});

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