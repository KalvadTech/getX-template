// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromString(String jsonString) => UserModel.fromJson(json.decode(jsonString));
UserModel userModelFromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.username,
    this.phone,
    this.role,
    this.id,
    this.email,
    this.password,
  });

  String? username;
  String? phone;
  String? role;
  String? id;
  String? email;
  String? password;

  UserModel copyWith({
    String? username,
    String? phone,
    String? role,
    String? id,
    String? email,
    String? password,
  }) =>
      UserModel(
          username: username,
          phone: phone,
          role: role,
          id: id,
          email: email,
          password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        phone: json["phone"],
        role: json["role"],
        email: json["email"],
      );

  factory UserModel.empty() => UserModel(
        id: "",
        username: "",
        phone: "",
        role: "",
        email: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username":username,
        "phone": phone,
        "email": email,
        "role": role,
      };
}
