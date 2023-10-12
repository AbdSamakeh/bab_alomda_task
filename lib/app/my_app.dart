import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    //!For Status Bar Color And Customization
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColorManger.mainAppColor, // transparent status bar
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
    );

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return SafeArea(
          child: MaterialApp(
            navigatorKey: MyApp.myAppKey,
            theme:
                // (context.watch<AppThemeBloc>().state.appTheme ==
                // AppThemeStates.light)
                // ?
                lightTheme(context: context),
            // : darkTheme(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateRoute: appRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
