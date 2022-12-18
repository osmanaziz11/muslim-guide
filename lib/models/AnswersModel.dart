// ignore_for_file: file_senderNames
class AnswersModel {
  late String questionId;
  late String answerById;
  String? answerByEmail;
  String? answerByName;
  String? answerByPic;
  String? answer;
  // late DateTime sendon;

  AnswersModel({
    required this.questionId,
    required this.answerById,
    this.answerByEmail,
    this.answerByName,
    this.answerByPic,
    this.answer,
  });

  AnswersModel.fromMap(Map<String, dynamic> map) {
    questionId = map["questionId"];
    answerById = map["answerById"];
    answerByEmail = map["answerByEmail"];
    answerByName = map["answerByName"];
    answerByPic = map["answerByPic"];
    answer = map["answer"];
  }

  Map<String, dynamic> toMap() {
    return {
      "questionId": questionId,
      "answerById": answerById,
      "answerByEmail": answerByEmail,
      "answerByName": answerByName,
      "answerByPic": answerByPic,
      "answer": answer,
    };
  }
}
