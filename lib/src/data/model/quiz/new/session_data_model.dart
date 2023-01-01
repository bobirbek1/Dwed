class SessionDataModel {
  int? id;
  int? participantNumber;
  int? participantFinishNumber;
  Quiz? quiz;
  int? participantWithoutPlace;
  String? createDate;
  int? questionTime;
  bool? sendQuestion;
  bool? sendAnswer;
  dynamic finishDate;
  dynamic winner;
  bool? isOpened;
  String? creator;
  int? type;
  String? expectedDate;
  dynamic expectedParticipants;
  dynamic timeSpend;
  String? expectedEndDate;
  int? winnerNumber;
  int? questionNumber;
  dynamic isCode;
  String? reward;
  dynamic myPlace;
  String? status;
  int? offset;

  SessionDataModel(
      {id,
        participantNumber,
        participantFinishNumber,
        quiz,
        participantWithoutPlace,
        createDate,
        questionTime,
        sendQuestion,
        sendAnswer,
        finishDate,
        winner,
        isOpened,
        creator,
        type,
        expectedDate,
        expectedParticipants,
        timeSpend,
        expectedEndDate,
        winnerNumber,
        questionNumber,
        isCode,
        reward,
        myPlace,
        status});

  SessionDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participantNumber = json['participant_number'];
    participantFinishNumber = json['participant_finish_number'];
    quiz = json['quiz'] != null ?  Quiz.fromJson(json['quiz']) : null;
    participantWithoutPlace = json['participant_without_place'];
    createDate = json['create_date'];
    questionTime = json['question_time'];
    sendQuestion = json['send_question'];
    sendAnswer = json['send_answer'];
    finishDate = json['finish_date'];
    winner = json['winner'];
    isOpened = json['is_opened'];
    creator = json['creator'];
    type = json['type'];
    expectedDate = json['expected_date'];
    expectedParticipants = json['expected_participants'];
    timeSpend = json['time_spend'];
    expectedEndDate = json['expected_end_date'];
    winnerNumber = json['winner_number'];
    questionNumber = json['question_number'];
    isCode = json['is_code'];
    reward = json['reward'];
    myPlace = json['my_place'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['participant_number'] = participantNumber;
    data['participant_finish_number'] = participantFinishNumber;
    if (quiz != null) {
      data['quiz'] = quiz!.toJson();
    }
    data['participant_without_place'] = participantWithoutPlace;
    data['create_date'] = createDate;
    data['question_time'] = questionTime;
    data['send_question'] = sendQuestion;
    data['send_answer'] = sendAnswer;
    data['finish_date'] = finishDate;
    data['winner'] = winner;
    data['is_opened'] = isOpened;
    data['creator'] = creator;
    data['type'] = type;
    data['expected_date'] = expectedDate;
    data['expected_participants'] = expectedParticipants;
    data['time_spend'] = timeSpend;
    data['expected_end_date'] = expectedEndDate;
    data['winner_number'] = winnerNumber;
    data['question_number'] = questionNumber;
    data['is_code'] = isCode;
    data['reward'] = reward;
    data['my_place'] = myPlace;
    data['status'] = status;
    return data;
  }
}

class Quiz {
  int? id;
  String? name;
  String? description;
  List<dynamic>? images;

  Quiz({id, name, description, images});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['images'] != null) {
      images = <dynamic>[];
      json['images'].forEach((v) {
        images!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}