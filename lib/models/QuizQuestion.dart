// ignore_for_file: file_names

class QuizQuestion {
  late int answerIndex;
  late String title;
  late List<dynamic> options;

  QuizQuestion(
      {required this.answerIndex, required this.title, required this.options});

  QuizQuestion.fromMap(Map<String, dynamic> map) {
    title = map["title"];
    answerIndex = map["answerIndex"];
    options = map["options"];
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "options": options,
      "answerIndex": answerIndex,
    };
  }
}
