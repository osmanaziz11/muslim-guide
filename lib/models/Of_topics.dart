// ignore_for_file: file_names

class OfflineQuizTopic {
  late String title;

  OfflineQuizTopic({required this.title});

  OfflineQuizTopic.fromMap(Map<String, dynamic> map) {
    title = map["title"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": title,
    };
  }
}
