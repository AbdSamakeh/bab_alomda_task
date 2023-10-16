import 'package:mockito/annotations.dart';
import 'package:top_story_nyt/core/api/api_methods.dart';
import 'package:top_story_nyt/core/api/connector.dart';
import 'package:top_story_nyt/features/news/data/datasources/local/news_local.dart';
import 'package:top_story_nyt/features/news/data/datasources/remote/news_remote.dart';
import 'package:top_story_nyt/features/news/domain/repositories/news_repository.dart';
import 'package:top_story_nyt/features/news/domain/usecases/get_news_usecase.dart';

@GenerateMocks([
  NewsRepository,
  NewsRemote,
  NewsLocal,
  GetNewsUsecase
], customMocks: [
  MockSpec<ApiMethods>(as: #MockApiMethod),
  MockSpec<Connector>(as: #MockConnector)
])
void main() {}
