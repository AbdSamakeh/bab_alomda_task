import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/theme/theme_cubit/theme_cubit.dart';
import '../core/injection/injection_container.dart';
import '../core/resource/color_manger.dart';
import '../core/storage/shared/shared_pref.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/theme/app_theme.dart';
import '../router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final myAppKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();

  @override
  void didChangeDependencies() {
    String languageCode = EasyLocalization.of(context)!.locale.toString();
    AppSharedPreferences.cashLanguage(language: languageCode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return SafeArea(
          child: BlocProvider.value(
            value: themeCubit,
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                //!For Status Bar Color And Customization
                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                      statusBarColor: AppSharedPreferences.getCashedThemeMode()
                          ? AppColorManger.mainAppColor
                          : AppColorManger
                              .secondaryAppColor, // transparent status bar
                      statusBarBrightness:
                          AppSharedPreferences.getCashedThemeMode()
                              ? Brightness.light
                              : Brightness.dark,
                      statusBarIconBrightness:
                          AppSharedPreferences.getCashedThemeMode()
                              ? Brightness.light
                              : Brightness.dark),
                );
                return MaterialApp(
                  navigatorKey: MyApp.myAppKey,
                  themeMode:
                      state.isLightMode ? ThemeMode.light : ThemeMode.dark,
                  darkTheme: darkTheme(),
                  theme: lightTheme(),
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  onGenerateRoute: appRouter.onGenerateRoute,
                  debugShowCheckedModeBanner: false,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
