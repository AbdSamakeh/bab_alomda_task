// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/navigation/fade_builder_route.dart';

import '../core/page/not_found_page.dart';
import '../core/injection/injection_container.dart' as di;
import '../features/intro/presentation/pages/splash_page.dart';

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
      // case RouteNamedScreens.newsNameRoutePage:
      //   return FadeBuilderRoute(
      //     page: BlocProvider(
      //       lazy: true,
      //       create: (context) => di.sl<SendCodeCubit>(),
      //       child: const LoginPage(),
      //     ),
      //   );
      //
      //!Deafult Page To Handel Routing Failure
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
}
