//The Abstraction Repository Class For News Feature
//Only The Methods Define Here Without The Implemntation
import 'package:dartz/dartz.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';

import '../../../../core/error/failures.dart';

//Only The Formal Of Method Defined Here
//Either Typy Make Function Returns Left And Rifht Values
//Left Is Type Of Failure Classes
//Right Is The Data Fetched From Api Call
abstract class NewsRepository {
  //Get News
  Future<Either<Failure, NewsResponseEntite>> getNews();
}
