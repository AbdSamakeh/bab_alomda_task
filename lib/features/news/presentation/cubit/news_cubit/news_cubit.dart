// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:top_story_nyt/core/resource/enum_manger.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';
import 'package:top_story_nyt/features/news/domain/usecases/get_news_usecase.dart';

import '../../../../../core/error/error_entite.dart';
import '../../../../../core/function/maping_failure.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  //Instance Of Usecase To Reach Domain Layer And Start The Flow
  final GetNewsUsecase newsUsecase;
  NewsCubit({
    required this.newsUsecase,
  }) : super(NewsState.initial());
  //Get News Throw Calling Usecase Function
  getNewsData() async {
    //Alert UI That The Status Is Loading
    emit(state.copyWith(status: CubitStatus.loading));
    //Call Usecase In Callable Class Way
    final result = await newsUsecase();
    //!Check if Bloc Closed
    if (isClosed) return;
    //Result Came In Flod That Make The Handler Of Left And Right Senario
    result.fold(
      //Left Faliure
      (failure) async {
        //Mapping Failure
        //And Extract Faliure Message Throw Logic In mapFailure Function
        final ErorrEntite errorEntite = await mapFailure(failure: failure);
        //Alert UI That The Status Is Loading And Error Message To Showed
        emit(
          state.copyWith(
            errorMessage: errorEntite.errorMessage,
            status: CubitStatus.error,
          ),
        );
      },
      //Right Data
      (newsData) {
        //Fill List Sections List For Fetched Data
        List<String> sections = [];
        for (var item in newsData.results) {
          if (!sections.contains(item.section)) {
            sections.add(item.section);
          }
        }
        //Alert UI That The Status Is Succses And The Data Sended To UI
        emit(
          state.copyWith(
              newsList: newsData.results,
              sections: sections,
              status: CubitStatus.succses,
              newsResponseEntite: newsData),
        );
      },
    );
  }

  //Search Or Filter In News By Title Or Author
  newsSearchAndFilter({
    required String searchQuery,
    required List<News> newsList,
    required bool reset,
    required bool isSearch,
  }) {
    emit(
      state.copyWith(
        status: CubitStatus.loading,
      ),
    );
    if (reset) {
      emit(
        state.copyWith(
          newsList: newsList,
          newsResponseEntite: state.newsResponseEntite,
          status: CubitStatus.succses,
        ),
      );
    } else if (isSearch) {
      //Search In Title By Author Name
      List<News> searchResult = [];
      for (var item in newsList) {
        if (item.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            item.byline.toLowerCase().contains(searchQuery.toLowerCase())) {
          searchResult.add(item);
        }
      }
      emit(
        state.copyWith(
          newsList: searchResult,
          newsResponseEntite: state.newsResponseEntite,
          status: CubitStatus.succses,
        ),
      );
    } else {
      //Search By Sections (Filtter)
      List<News> searchResult = [];
      for (var item in newsList) {
        if (item.section.toLowerCase().contains(searchQuery.toLowerCase())) {
          searchResult.add(item);
        }
      }
      emit(
        state.copyWith(
          newsList: searchResult,
          newsResponseEntite: state.newsResponseEntite,
          status: CubitStatus.succses,
        ),
      );
    }
  }
}
