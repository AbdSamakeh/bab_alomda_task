import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:top_story_nyt/features/news/data/models/news_model.dart';
import 'package:top_story_nyt/features/news/data/repositories/news_repository_implement.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockNewsRemote mockNewsRemote;
  late MockNewsLocal mockNewsLocal;
  late NewsRepositoryImplements newsRepositoryImplements;
  late MockConnector connector;

  const testNewsModel =
      NewsModel(status: '', section: '', numNewss: 0, results: []);
  const testNewsEntite =
      NewsResponseEntite(status: '', section: '', numNewss: 0, results: []);

  setUp(() {
    mockNewsLocal = MockNewsLocal();
    mockNewsRemote = MockNewsRemote();
    newsRepositoryImplements = NewsRepositoryImplements(
        newsRemote: mockNewsRemote, newsLocal: mockNewsLocal);
    connector = MockConnector();
  });

  group('Get News Data', () {
    test(
      'Should Return News When A Call Data Source Is Sucsseful',
      () async {
        //Arrange
        when(mockNewsRemote.getNews()).thenAnswer((_) async => testNewsModel);
        //Act
        final result = await newsRepositoryImplements.getNews();

        //Assert
        expect(result, equals(const Right(testNewsModel)));
      },
    );
  });
}
