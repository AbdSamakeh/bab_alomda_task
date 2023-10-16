// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final newsResponseEntite = newsResponseEntiteFromJson(jsonString);


import 'package:equatable/equatable.dart';

import '../../../data/models/news_model.dart';



class NewsResponseEntite extends Equatable {
  final String? status;
  final String? section;
  final int? numNewss;
  final List<News>? results;

  const NewsResponseEntite({
    required this.status,
    required this.section,
    required this.numNewss,
    required this.results,
  });

  //! To Make Initial Object Instance With Deafults Values
  factory NewsResponseEntite.initial() {
    return newsFromJson('{}');
  }

  

  @override
  List<Object?> get props => [status, section, numNewss, results];
}

class News {
  final String section;
  final String subsection;
  final String title;
  final String resultAbstract;
  final String url;
  final String uri;
  final String byline;
  final String itemType;
  final DateTime publishedDate;
  final List<Multimedia> multimedia;
  final String shortUrl;

  News({
    required this.section,
    required this.subsection,
    required this.title,
    required this.resultAbstract,
    required this.url,
    required this.uri,
    required this.byline,
    required this.itemType,
    required this.publishedDate,
    required this.multimedia,
    required this.shortUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        section: json["section"] ?? '',
        subsection: json["subsection"] ?? '',
        title: json["title"] ?? '',
        resultAbstract: json["abstract"] ?? '',
        url: json["url"] ?? '',
        uri: json["uri"] ?? "",
        byline: json["byline"] ?? "",
        itemType: json["item_type"] ?? "",
        publishedDate: json["published_date"] == null
            ? DateTime(0)
            : DateTime.parse(json["published_date"]),
        multimedia: json["multimedia"] == null
            ? []
            : List<Multimedia>.from(
                json["multimedia"].map((x) => Multimedia.fromJson(x))),
        shortUrl: json["short_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "subsection": subsection,
        "title": title,
        "abstract": resultAbstract,
        "url": url,
        "uri": uri,
        "byline": byline,
        "item_type": itemType,
        "published_date": publishedDate.toIso8601String(),
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "short_url": shortUrl,
      };
}

class Multimedia {
  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

  Multimedia({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"] ?? '',
        format: json["format"] ?? '',
        height: json["height"] ?? 0,
        width: json["width"] ?? 0,
        type: json["type"] ?? '',
        subtype: json["subtype"] ?? '',
        caption: json["caption"] ?? '',
        copyright: json["copyright"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
      };
}
