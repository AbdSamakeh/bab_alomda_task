import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';
import 'package:top_story_nyt/features/news/domain/usecases/get_news_usecase.dart';

import '../../../helper/test_helper.mocks.dart';


void main() {
  late GetNewsUsecase? getNewsUsecase;
  late MockNewsRepository mockNewsRepository;

  NewsResponseEntite testNewsDetails = NewsResponseEntite.initial();

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    getNewsUsecase = GetNewsUsecase(newsRepository: mockNewsRepository);
  });

  test('Should Get News From The Repository', () async {
    //Arrange
    when(mockNewsRepository.getNews() as Function)
        .thenAnswer((_) async{return; });
    //Act
    final result = await getNewsUsecase!();

    //Assert
    expect(result, Right(testNewsDetails));
  });
}
