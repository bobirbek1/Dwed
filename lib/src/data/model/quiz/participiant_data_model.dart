class ParticipantDataModel {
  int? id;
  int? participantNumber;
  int? questionNumber;
  Quiz? quiz;
  String? createDate;
  String? startDate;
  String? finishDate;
  String? code;
  int? questionTime;
  bool? sendQuestion;
  bool? sendAnswer;
  int? passedQuestion;
  bool? isOpened;
  String? creator;
  int? type;
  String? expectedDate;

  ParticipantDataModel(
      {id,
        participantNumber,
        questionNumber,
        quiz,
        createDate,
        startDate,
        finishDate,
        code,
        questionTime,
        sendQuestion,
        sendAnswer,
        passedQuestion,
        isOpened,
        creator,
        type,
        expectedDate});

  ParticipantDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participantNumber = json['participant_number'];
    questionNumber = json['question_number'];
    quiz = json['quiz'] != null ? Quiz.fromJson(json['quiz']) : null;
    createDate = json['create_date'];
    startDate = json['start_date'];
    finishDate = json['finish_date'];
    code = json['code'];
    questionTime = json['question_time'];
    sendQuestion = json['send_question'];
    sendAnswer = json['send_answer'];
    passedQuestion = json['passed_question'];
    isOpened = json['is_opened'];
    creator = json['creator'];
    type = json['type'];
    expectedDate = json['expected_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['participant_number'] = participantNumber;
    data['question_number'] = questionNumber;
    if (quiz != null) {
      data['quiz'] = quiz!.toJson();
    }
    data['create_date'] = createDate;
    data['start_date'] = startDate;
    data['finish_date'] = finishDate;
    data['code'] = code;
    data['question_time'] = questionTime;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    data['passed_question'] = passedQuestion;
    data['is_opened'] = isOpened;
    data['creator'] = creator;
    data['type'] = type;
    data['expected_date'] = expectedDate;
    return data;
  }
}

class Quiz {
  int? id;
  String? name;
  String? description;

  Quiz({id, name, description});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}