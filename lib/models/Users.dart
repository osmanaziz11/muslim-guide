// ignore_for_file: file_names

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? profilepic;

  UserModel({this.uid, this.name, this.password, this.email, this.profilepic});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    name = map["name"];
    password = map["password"];
    email = map["email"];
    profilepic = map["profilepic"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "password": password,
      "email": email,
      "profilepic": profilepic,
    };
  }
}
