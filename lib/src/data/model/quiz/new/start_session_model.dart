class StartSessionModel {
  int? type;
  String? expectedDate;
  bool? useCode = false;
  int? expectedParticipant;
  String? expectedEndDate;
  int? winnerNumber;
  String? reward;
  int? questionTime;
  bool? sendQuestion = true;
  bool? sendAnswer = true;

  StartSessionModel(
      {type,
        expectedDate,
        useCode,
        expectedParticipant,
        expectedEndDate,
        winnerNumber,
        reward,
        questionTime,
        sendQuestion,
        sendAnswer});

  StartSessionModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    expectedDate = json['expected_date'];
    useCode = json['use_code'];
    expectedParticipant = json['expected_participant'];
    expectedEndDate = json['expected_end_date'];
    winnerNumber = json['winner_number'];
    reward = json['reward'];
    questionTime = json['question_time'];
    sendQuestion = json['send_question'];
    sendAnswer = json['send_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['expected_date'] = expectedDate;
    data['use_code'] = useCode;
    data['expected_participant'] = expectedParticipant;
    data['expected_end_date'] = expectedEndDate;
    data['winner_number'] = winnerNumber;
    data['reward'] = reward;
    data['question_time'] = questionTime;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    return data;
  }
}