import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../router/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  //!Functions
  //Logical Function To Navigate Correct Screen If there Is Any Authntication Or Saved Token..
  getCorrectScreen(BuildContext context) {
    // Navigator.pushReplacementNamed(
    //     context, RouteNamedScreens.newsNameRoutePage);
  }

  //Function To Make Loader For Splash Screen Time
  timerLoad(BuildContext context) {
    Timer(const Duration(seconds: 2), () => getCorrectScreen(context));
  }

  @override
  Widget build(BuildContext context) {
    //Start Timer When Root Widget Build
    timerLoad(context);
    //Page
    return const SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          // SizedBox(
          //   width: AppWidthManger.w100,
          //   height: AppHeightManger.h100,
          //   child: VideoPlayer(_controller),
          // ),
          // Positioned(
          //   bottom: 48,
          //   child: TextUtils(
          //     text: 'V 1.0.0',
          //     fontSize: FontSizeManger.fs16,
          //     fontWeight: FontWeightManger.bold,
          //   ),
          // ),
          // Positioned(
          //   bottom: 48,
          //   child: Column(
          //     children: [
          //       //Version
          //       TextUtils(
          //         text: 'V 1.0.0',
          //         fontSize: FontSizeManger.fs16,
          //         fontWeight: FontWeightManger.bold,
          //       ),
          //     ],
          //   ),
          // )
        ],
      )),
    );
  }
}
