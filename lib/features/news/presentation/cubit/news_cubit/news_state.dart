// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_cubit.dart';

class NewsState extends Equatable {
  //Variable Handel Error Messages
  final String errorMessage;
  //Variable Handel Status Of Cubit
  final CubitStatus status;
  //Variable Handel Fetched Data
  final NewsResponseEntite newsResponseEntite;
  //News Sections
  final List<String> sections;
  //News List
  final List<News> newsList;
  //Constracture
  const NewsState({
    required this.errorMessage,
    required this.status,
    required this.newsResponseEntite,
    required this.sections,
    required this.newsList,
  });
  //Initilization Of State With Deafult Values
  factory NewsState.initial() {
    return NewsState(
      newsList: const [],
      sections: const [],
      errorMessage: '',
      status: CubitStatus.initial,
      newsResponseEntite: NewsResponseEntite.initial(),
    );
  }
  //To Keep Data And Status Saved
  NewsState copyWith({
    String? errorMessage,
    CubitStatus? status,
    NewsResponseEntite? newsResponseEntite,
    List<News>? newsList,
    List<String>? sections,
  }) {
    return NewsState(
      newsList: newsList ?? this.newsList,
      sections: sections ?? this.sections,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      newsResponseEntite: newsResponseEntite ?? this.newsResponseEntite,
    );
  }

  //Equatable Variables
  @override
  List<Object> get props =>
      [errorMessage, status, newsResponseEntite, newsList];
}
