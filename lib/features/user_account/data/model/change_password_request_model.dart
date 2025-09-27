// To parse this JSON data, do
//
//     final changePasswordRequestModel = changePasswordRequestModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequestModel changePasswordRequestModelFromJson(String str) =>
    ChangePasswordRequestModel.fromJson(json.decode(str));

String changePasswordRequestModelToJson(ChangePasswordRequestModel data) =>
    json.encode(data.toJson());

class ChangePasswordRequestModel {
  String newPassword;
  String oldPassword;

  ChangePasswordRequestModel({
    required this.newPassword,
    required this.oldPassword,
  });

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequestModel(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "newPassword": newPassword,
        "oldPassword": oldPassword,
      };
}
