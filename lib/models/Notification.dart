// ignore_for_file: file_senderNames

class NotificationModel {
  late String rID;
  String? senderName;
  String? senderEmail;
  String? type;
  String? roomID;
  late DateTime sendon;

  NotificationModel(
      {required this.rID,
      this.senderName,
      this.senderEmail,
      this.type,
      this.roomID,
      required this.sendon});

  NotificationModel.fromMap(Map<String, dynamic> map) {
    rID = map["rID"];
    senderName = map["senderName"];
    senderEmail = map["senderEmail"];
    roomID = map["roomID"];
    type = map["type"];
    sendon = map["sendon"];
  }

  Map<String, dynamic> toMap() {
    return {
      "rID": rID,
      "senderName": senderName,
      "senderEmail": senderEmail,
      "roomID": roomID,
      "type": type,
      "sendon": sendon,
    };
  }
}
