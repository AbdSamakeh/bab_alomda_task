import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:top_story_nyt/core/error/failures.dart';
import 'package:top_story_nyt/core/resource/enum_manger.dart';
import 'package:top_story_nyt/features/news/data/models/news_model.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';
import 'package:top_story_nyt/features/news/presentation/cubit/news_cubit/news_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../helper/test_helper.mocks.dart';

void main() {
  late MockGetNewsUsecase mockGetNewsUsecase;
  late NewsCubit newsCubit;

  const testNewsEntite =
      NewsResponseEntite(status: '', section: '', numNewss: 0, results: []);

  setUp(() {
    mockGetNewsUsecase = MockGetNewsUsecase();
    newsCubit = NewsCubit(newsUsecase: mockGetNewsUsecase);
  });

  test('Initial State Should Be Empty', () {
    expect(newsCubit.state, NewsState.initial());
  });

  blocTest<NewsCubit, NewsState>(
    'emits [Status Loading,Status Sucsses] when MyEvent is added.',
    build: () {
      when(mockGetNewsUsecase())
          .thenAnswer((_) async => const Right(testNewsEntite));
      return newsCubit;
    },
    act: (bloc) => bloc.getNewsData(),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const NewsState(
          errorMessage: '',
          status: CubitStatus.loading,
          newsResponseEntite:
              NewsModel(numNewss: 0, results: [], section: '', status: ''),
          newsList: [],
          sections: []),
      const NewsState(
          errorMessage: '',
          status: CubitStatus.succses,
          newsResponseEntite: testNewsEntite,
          newsList: [],
          sections: []),
    ],
  );

  blocTest<NewsCubit, NewsState>(
    'emits [Status Failed] when MyEvent is added.',
    build: () {
      when(mockGetNewsUsecase()).thenAnswer((_) async => Left(ServerFailure()));
      return newsCubit;
    },
    act: (bloc) => bloc.getNewsData(),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const NewsState(
          errorMessage: '',
          status: CubitStatus.loading,
          newsResponseEntite:
              NewsModel(numNewss: 0, results: [], section: '', status: ''),
          newsList: [],
          sections: []),
      const NewsState(
          errorMessage: '',
          status: CubitStatus.error,
          newsResponseEntite:
              NewsModel(numNewss: 0, results: [], section: '', status: ''),
          newsList: [],
          sections: []),
    ],
  );
}
