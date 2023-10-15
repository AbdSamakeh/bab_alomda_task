// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:top_story_nyt/core/error/failures.dart';
import 'package:top_story_nyt/features/news/data/datasources/local/news_local.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';

import '../../../../core/api/connector.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/remote/news_remote.dart';

//The Implemntaion Of Each Metod Inside Domain Repository
//Here Connect Domain Layer To Data Layer Done
class NewsRepositoryImplements implements NewsRepository {
  //Define Instance Of Remote News
  //To Call Api End Point
  //Define Instance Of Local News
  //To Get Local Data Throw Database SQF If There Is Any Or If There Is Some Logic Need
  final NewsRemote newsRemote;
  final NewsLocal newsLocal;
  NewsRepositoryImplements({
    required this.newsRemote,
    required this.newsLocal,
  });
  //Get News Implementation
  @override
  Future<Either<Failure, NewsResponseEntite>> getNews() async {
    //The Connect Metod Inside Connector Class Take The Data Type Of Returned Data After Calling Remote
    //And Check If There Is Any Exception Return It As Left
    //And If The Data Fetched Returned It As Result Paramters To Above Layer
    return Connector<NewsResponseEntite>().connect(
      remote: () async {
        final result = await newsRemote.getNews();
        return Right(result);
      },
    );
  }
}
