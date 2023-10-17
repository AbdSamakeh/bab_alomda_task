import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:top_story_nyt/core/api/api_links.dart';
import 'package:top_story_nyt/features/news/data/datasources/remote/news_remote.dart';
import 'package:top_story_nyt/features/news/data/models/news_model.dart';

import '../../../../helper/json_reader.dart';
import '../../../../helper/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockApiMethod mockApiMethod;
  late NewsRemoteImplements newsRemoteImplements;

  setUp(() {
    mockApiMethod = MockApiMethod();
    newsRemoteImplements = NewsRemoteImplements();
  });

  group('Get News From End Point', () {
    test(
      'Should Return News Model When The Response Code Is 200',
      () async {
        //arrange
        when(mockApiMethod.get(url: ApiGetUrl.newsUrl)).thenAnswer(
          (_) async => http.Response(
              readJson('features/helper/dummy_data/dummy_news_response.json'),
              200),
        );
        //act
        final result = await newsRemoteImplements.getNews();

        //assert
        expect(result, isA<NewsModel>());
      },
    );
  });
}
