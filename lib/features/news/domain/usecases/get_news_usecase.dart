// ignore_for_file: public_member_api_docs, sort_constructors_first
//Usecase Is The Part That Connect UI (Bloc ,Cubits , etc) To Domain Layer
import 'package:dartz/dartz.dart';
import 'package:top_story_nyt/features/news/domain/repositories/news_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/response/news_response_entite.dart';

//Each Use Case Class Call Specific Method On Repository
class GetNewsUsecase {
  final NewsRepository newsRepository;
  GetNewsUsecase({
    required this.newsRepository,
  });

  //Call Method In Dart Make Class Be Callable
  Future<Either<Failure, NewsResponseEntite>> call() async {
    return await newsRepository.getNews();
  }
}
