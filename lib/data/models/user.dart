// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(List json) =>
    List<UserModel>.from(json.map((x) => UserModel.fromJson(x)));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.username,
    this.phone,
    this.role,
    this.id,
    this.token,
    this.password,
  });

  String? username;
  String? phone;
  String? role;
  String? id;
  String? token;
  String? password;

  UserModel copyWith({
    String? username,
    String? phone,
    String? role,
    String? id,
    String? token,
    String? password,
  }) =>
      UserModel(
          username: username,
          phone: phone,
          role: role,
          id: id,
          token: token,
          password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        phone: json["phone"],
        role: json["role"],
        token: json["token"],
      );

  factory UserModel.empty() => UserModel(
        id: "",
        username: "",
        phone: "",
        role: "",
        token: "",
        password: "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username":username,
        "phone": phone,
        "role": role,
      };
}
