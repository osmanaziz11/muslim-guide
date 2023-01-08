// ignore_for_file: file_senderNames

class AskModel {
  late String questionId;
  late String askById;
  String? askByEmail;
  String? askByName;
  String? askByPic;
  String? title;
  String? question;
  // late DateTime sendon;

  AskModel({
    required this.askById,
    this.askByEmail,
    this.askByName,
    this.askByPic,
    this.title,
    this.question,
    required this.questionId,
  });

  AskModel.fromMap(Map<String, dynamic> map) {
    askById = map["askById"];
    askByEmail = map["askByEmail"];
    askByName = map["askByName"];
    askByPic = map["askByPic"];
    title = map["title"];
    question = map["question"];
    questionId = map["questionId"];
    // sendon = map["sendon"];
  }

  Map<String, dynamic> toMap() {
    return {
      "askById": askById,
      "askByEmail": askByEmail,
      "askByName": askByName,
      "askByPic": askByPic,
      "title": title,
      "question": question,
      "questionId": questionId,
      // "sendon": sendon,
    };
  }
}
