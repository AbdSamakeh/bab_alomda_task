import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:top_story_nyt/features/news/data/models/news_model.dart';
import 'package:top_story_nyt/features/news/domain/entities/request/news_request_entite.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';

import '../../../helper/json_reader.dart';

void main() {
  NewsModel testNewsModel = NewsModel(
    numNewss: 0,
    section: '',
    status: '',
    results: [
      News(
        publishedDate: DateTime(0),
        resultAbstract: '',
        section: '',
        uri: '',
        shortUrl: '',
        subsection: '',
        title: '',
        url: '',
        byline: '',
        itemType: '',
        multimedia: [
          Multimedia(
              url: '',
              format: '',
              height: 0,
              width: 0,
              type: '',
              subtype: '',
              caption: '',
              copyright: '')
        ],
      ),
    ],
  );

  NewsRequestEntite testNewsRequest = NewsRequestEntite(apiKey: '');
  test('News Model Should Be A Sub Class Of NewResponseEntite', () async {
    //assert
    expect(testNewsModel, isA<NewsResponseEntite>());
  });

  test('Should Return A Valid Model From Json', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('features/helper/dummy_data/dummy_news_response.json'),
    );
    //act
    final result = newsFromJson(json.encode(jsonMap)).toJson();
    //expect
    expect(result, equals(testNewsModel.toJson()));
  });

  test('Should Return A Json Map Containing Proper Data', () async {
    //act
    final result = testNewsRequest.toJson();
    //expect
    final expectedJsonMap = {'api-key': ''};
    expect(result, equals(expectedJsonMap));
  });
}
