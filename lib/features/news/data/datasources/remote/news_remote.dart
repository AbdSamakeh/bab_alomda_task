import '../../../domain/entities/request/news_request_entite.dart';

import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../../../core/error/exception.dart';
import '../../../domain/entities/response/news_response_entite.dart';

abstract class NewsRemote {
  Future<NewsResponseEntite> getNews();
}

class NewsRemoteImplements extends NewsRemote {
  //Calling Api End Point Impelementation
  //Call Get News Remote Implementation
  @override
  Future<NewsResponseEntite> getNews() async {
    final response = await ApiMethods().get(
      //End Point Here Throw ApiGetUrl Class
      url: ApiGetUrl.newsUrl,
      //In This Case The Query It Always Contain Api Key Parameters
      //So It Is Initilize Instance Of News Request Entite
      //With Deafult Value Of Server Key
      //So There Is No Need To Pass It Throw UI In The Function Parameter
      query: NewsRequestEntite.initial().toJson(),
    );
    //Check Response Status Code
    //If It Succses Pars Coming Data To Dart Object
    //And Return It To Repository Impelemntation Layer
    if (response.statusCode == 200) {
      return newsResponseEntiteFromJson(response.body);
    } else {
      throw ServerException(response: response);
    }
  }
}
