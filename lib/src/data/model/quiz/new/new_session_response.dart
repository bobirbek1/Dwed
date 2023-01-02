class StartSessionResponseModel {
  int? id;
  String? createDate;
  String? startDate;
  String? finishDate;
  String? code;
  int? questionTime;
  String? reward;
  bool? sendQuestion;
  bool? sendAnswer;
  int? passedQuestion;
  bool? isOpened;
  String? creator;
  int? type;
  String? expectedDate;
  int? expectedParticipants;
  String? expectedEndDate;
  int? winnerNumber;
  int? quiz;

  ///added
  String? name;
  int? timeLimit;
  int? questionNumber;

  StartSessionResponseModel(
      {this.id,
        this.createDate,
        this.startDate,
        this.finishDate,
        this.code,
        this.questionTime,
        this.reward,
        this.sendQuestion,
        this.sendAnswer,
        this.passedQuestion,
        this.isOpened,
        this.creator,
        this.type,
        this.expectedDate,
        this.expectedParticipants,
        this.expectedEndDate,
        this.winnerNumber,
        this.quiz});

  StartSessionResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    startDate = json['start_date'];
    finishDate = json['finish_date'];
    code = json['code'];
    questionTime = json['question_time'];
    reward = json['reward'];
    sendQuestion = json['send_question'];
    sendAnswer = json['send_answer'];
    passedQuestion = json['passed_question'];
    isOpened = json['is_opened'];
    creator = json['creator'];
    type = json['type'];
    expectedDate = json['expected_date'];
    expectedParticipants = json['expected_participants'];
    expectedEndDate = json['expected_end_date'];
    winnerNumber = json['winner_number'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['create_date'] = createDate;
    data['start_date'] = startDate;
    data['finish_date'] = finishDate;
    data['code'] = code;
    data['question_time'] = questionTime;
    data['reward'] = reward;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    data['passed_question'] = passedQuestion;
    data['is_opened'] = isOpened;
    data['creator'] = creator;
    data['type'] = type;
    data['expected_date'] = expectedDate;
    data['expected_participants'] = expectedParticipants;
    data['expected_end_date'] = expectedEndDate;
    data['winner_number'] = winnerNumber;
    data['quiz'] = quiz;
    return data;
  }
}