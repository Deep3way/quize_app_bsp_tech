class QuestionsModel {
  int? sTATUSCODE;
  String? mESSAGE;
  DATA? dATA;

  QuestionsModel({this.sTATUSCODE, this.mESSAGE, this.dATA});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    sTATUSCODE = json['STATUS_CODE'];
    mESSAGE = json['MESSAGE'];
    dATA = json['DATA'] != null ? DATA.fromJson(json['DATA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STATUS_CODE'] = sTATUSCODE;
    data['MESSAGE'] = mESSAGE;
    if (dATA != null) {
      data['DATA'] = dATA!.toJson();
    }
    return data;
  }
}

class DATA {
  List<Questions>? questions;

  DATA({this.questions});

  DATA.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? questionId;
  String? question;
  String? ansA;
  String? ansB;
  String? ansC;
  String? ansD;
  String? answer;

  Questions(
      {this.questionId,
      this.question,
      this.ansA,
      this.ansB,
      this.ansC,
      this.ansD,
      this.answer});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    question = json['question'];
    ansA = json['ans_a'];
    ansB = json['ans_b'];
    ansC = json['ans_c'];
    ansD = json['ans_d'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['question'] = question;
    data['ans_a'] = ansA;
    data['ans_b'] = ansB;
    data['ans_c'] = ansC;
    data['ans_d'] = ansD;
    data['answer'] = answer;
    return data;
  }
}
