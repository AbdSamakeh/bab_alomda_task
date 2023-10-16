import 'dart:convert';

import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';

NewsModel newsFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel extends NewsResponseEntite {
  const NewsModel(
      {required super.status,
      required super.section,
      required super.numNewss,
      required super.results});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"] ?? '',
        section: json["section"] ?? '',
        numNewss: json["num_results"] ?? 0,
        results: json["results"] == null
            ? []
            : List<News>.from(json["results"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "section": section,
        "num_results": numNewss,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
  NewsResponseEntite toEntite() => NewsResponseEntite(
      status: status, section: section, numNewss: numNewss, results: results);
}
