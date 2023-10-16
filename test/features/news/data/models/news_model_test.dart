import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:top_story_nyt/features/news/data/models/news_model.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';

import '../../../helper/json_reader.dart';

void main() {
  NewsModel testNewsModel = NewsModel(
    numNewss: 24,
    section: 'home',
    status: 'Ok',
    results: [
      News(
        publishedDate: DateTime.now(),
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
              height: 1,
              width: 1,
              type: '',
              subtype: '',
              caption: '',
              copyright: '')
        ],
      ),
    ],
  );

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
    final result = NewsModel.fromJson(jsonMap);
    //expect
    expect(result, equals(testNewsModel));
  });
}
