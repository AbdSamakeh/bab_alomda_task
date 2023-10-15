// To parse this JSON data, do
//
//     final newsRequestEntite = newsRequestEntiteFromJson(jsonString);

import 'dart:convert';

import 'package:top_story_nyt/core/resource/key_manger.dart';

NewsRequestEntite newsRequestEntiteFromJson(String str) =>
    NewsRequestEntite.fromJson(json.decode(str));

String newsRequestEntiteToJson(NewsRequestEntite data) =>
    json.encode(data.toJson());

class NewsRequestEntite {
  final String? apiKey;

  NewsRequestEntite({
    this.apiKey,
  });

  //! To Make Initial Object Instance With Deafults Values Defined
  factory NewsRequestEntite.initial() {
    return newsRequestEntiteFromJson('{}');
  }

  factory NewsRequestEntite.fromJson(Map<String, dynamic> json) =>
      NewsRequestEntite(
        apiKey: json["api-key"] ?? AppKeyManger.serverKey,
      );

  Map<String, dynamic> toJson() => {
        "api-key": apiKey,
      };
}
