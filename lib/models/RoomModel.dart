// ignore_for_file: file_names

class RoomModel {
  late String hostID;
  late String hostName;
  late String hostEmail;
  late String? errorMsg = "";
  bool? roomStatus = false;

  RoomModel(
      {required this.hostID,
      required this.hostName,
      required this.hostEmail,
      this.errorMsg,
      this.roomStatus});

  RoomModel.fromMap(Map<String, dynamic> map) {
    hostID = map["hostID"];
    hostName = map["hostName"];
    hostEmail = map["hostEmail"];
    errorMsg = map["errorMsg"];
    roomStatus = map["roomStatus"];
  }
  Map<String, dynamic> toMap() {
    return {
      "hostID": hostID,
      "hostName": hostName,
      "hostEmail": hostEmail,
      "errorMsg": errorMsg,
      "roomStatus": roomStatus
    };
  }
}
