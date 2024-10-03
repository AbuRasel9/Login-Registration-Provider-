// To parse this JSON data, do
//
//     final registrationRequest = registrationRequestFromJson(jsonString);

import 'dart:convert';

RegistrationRequest registrationRequestFromJson(String str) => RegistrationRequest.fromJson(json.decode(str));

String registrationRequestToJson(RegistrationRequest data) => json.encode(data.toJson());

class RegistrationRequest {
  String? email;
  String? password;

  RegistrationRequest({
    this.email,
    this.password,
  });

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) => RegistrationRequest(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
