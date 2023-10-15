import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:top_story_nyt/core/resource/color_manger.dart';
import 'package:top_story_nyt/core/resource/lottie_manager.dart';
import 'package:top_story_nyt/core/resource/size_manger.dart';
import 'package:top_story_nyt/core/widget/text/app_text_widget.dart';
import 'package:top_story_nyt/generated/locale_keys.g.dart';

import '../../../../core/resource/font_manger.dart';
import '../../../../router/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  //!Functions
  //Logical Function To Navigate Correct Screen If there Is Any Authntication Or Saved Token..
  getCorrectScreen(BuildContext context) {
    Navigator.pushReplacementNamed(
        context, RouteNamedScreens.newsNameRoutePage);
  }

  //Function To Make Loader For Splash Screen Time
  timerLoad(BuildContext context) {
    Timer(const Duration(seconds: 3), () => getCorrectScreen(context));
  }

  @override
  Widget build(BuildContext context) {
    //Start Timer When Root Widget Build
    timerLoad(context);
    //Page
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: AppWidthManger.w100,
        height: AppHeightManger.h100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //Welcome Title
            Positioned(
              top: AppHeightManger.h10,
              child: AppTextWidget(
                text: LocaleKeys.nytNews.tr(),
                fontSize: FontSizeManger.fs24,
                fontWeight: FontWeightManger.boldWeight,
              ),
            ),
            //Lottie Animation
            LottieBuilder.asset(
              LottieManager.splashLottie,
              repeat: false,
            ),
            //App Version
            Positioned(
              bottom: AppHeightManger.h6,
              child: AppTextWidget(
                text: '${LocaleKeys.version.tr()} 1.0.0',
                fontSize: FontSizeManger.fs16,
                fontWeight: FontWeightManger.boldWeight,
              ),
            )
          ],
        ),
      )),
    );
  }
}