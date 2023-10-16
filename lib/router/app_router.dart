import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_story_nyt/features/news/presentation/cubit/news_cubit/news_cubit.dart';
import 'package:top_story_nyt/features/news/presentation/pages/news_details_page.dart';
import 'package:top_story_nyt/features/news/presentation/pages/news_page.dart';
import 'package:top_story_nyt/core/page/web_view_page.dart';
import '../core/injection/injection_container.dart';
import '../core/navigation/fade_builder_route.dart';

import '../core/page/not_found_page.dart';
import '../core/injection/injection_container.dart' as di;
import '../features/intro/presentation/pages/splash_page.dart';
import '../features/news/domain/entities/response/news_response_entite.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      //!Intro
      //Splash
      case RouteNamedScreens.splashNameRoutePage:
        return FadeBuilderRoute(page: const SplashPage());
      //!News
      //News Page
      case RouteNamedScreens.newsNameRoutePage:
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<NewsCubit>()..getNewsData(),
              ),
              BlocProvider.value(
                value: themeCubit,
              ),
            ],
            child: const NewsPage(),
          ),
        );
      //News Details Page
      case RouteNamedScreens.newsDetailsNameRoutePage:
        argument as News;
        return FadeBuilderRoute(
          page: NewsPageDetails(newsDetails: argument),
        );
      //!Deafult Page To Handel Routing Failure
      //!Core Pages
      //Web View Page
      case RouteNamedScreens.webViewNameRoutePage:
        argument as String;
        return FadeBuilderRoute(
          page: WebViewPage(url: argument),
        );
      default:
        return FadeBuilderRoute(page: const NotFoundPage());
    }
  }
}

class RouteNamedScreens {
  // Routing Naming Class
  //!Intro
  static const String splashNameRoutePage = '/';
  //!News Feature
  static const String newsNameRoutePage = '/news-page';
  static const String newsDetailsNameRoutePage = '/news-details-page';
  static const String webViewNameRoutePage = '/web-view-page';
}
