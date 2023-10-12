import 'dart:convert';

//!The Reason For This Entite To Handel Error Response From Server When Somethig Wrong Happend
//It Should Be Adabtive For Each Back-End Server Error
ErrorResponseEntite errorResponseEntiteFromJson(String str) =>
    ErrorResponseEntite.fromJson(json.decode(str));

class ErrorResponseEntite {
  final int errorCode;
  final String message;

  ErrorResponseEntite({
    required this.errorCode,
    required this.message,
  });

  factory ErrorResponseEntite.fromRawJson(String str) =>
      ErrorResponseEntite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponseEntite.fromJson(Map<String, dynamic> json) =>
      ErrorResponseEntite(
        errorCode: json["error_code"] ?? 0,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "message": message,
      };
}
