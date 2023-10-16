import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:top_story_nyt/core/function/global_functions.dart';
import 'package:top_story_nyt/core/widget/app_bar/main_app_bar.dart';
import 'package:top_story_nyt/core/widget/text/app_text_widget.dart';
import 'package:top_story_nyt/features/news/presentation/widgets/image_slider_widget.dart';
import 'package:top_story_nyt/generated/locale_keys.g.dart';
import 'package:top_story_nyt/router/app_router.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/font_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/storage/shared/shared_pref.dart';
import '../../domain/entities/response/news_response_entite.dart';

class NewsPageDetails extends StatelessWidget {
  const NewsPageDetails({
    Key? key,
    required this.newsDetails,
  }) : super(key: key);
  final News newsDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LocaleKeys.newsDetails.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidthManger.w4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SLider News Images
              ImageSliderWidget(multimedia: newsDetails.multimedia),
              SizedBox(
                height: AppHeightManger.h2,
              ),
              //News Title
              AppTextWidget(
                text: newsDetails.title,
                fontSize: FontSizeManger.fs18,
                fontWeight: FontWeightManger.boldWeight,
                overflow: TextOverflow.visible,
                color: AppSharedPreferences.getCashedThemeMode()
                    ? AppColorManger.black
                    : AppColorManger.white,
                padding: EdgeInsets.only(
                  bottom: AppHeightManger.h1,
                ),
              ),
              //News Descreption
              AppTextWidget(
                  overflow: TextOverflow.visible,
                  text: newsDetails.resultAbstract,
                  fontSize: FontSizeManger.fs16,
                  fontWeight: FontWeightManger.semiBoldWeight,
                  color: AppColorManger.darkGreyAppColor,
                  padding: EdgeInsets.only(bottom: AppHeightManger.h1)),
              //News Author Name
              Align(
                alignment: checkIfLTR(context: context)
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: AppTextWidget(
                  text: newsDetails.byline,
                  fontSize: FontSizeManger.fs16,
                  color: AppColorManger.secondaryAppColor,
                  fontWeight: FontWeightManger.semiBoldWeight,
                ),
              ),
              SizedBox(
                height: AppHeightManger.h2,
              ),
              //See All
              InkWell(
                onTap: () => Navigator.pushNamed(
                    context, RouteNamedScreens.webViewNameRoutePage,
                    arguments: newsDetails.url),
                child: Align(
                  alignment: checkIfLTR(context: context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: AppTextWidget(
                    text: LocaleKeys.seeMore.tr(),
                    decorationColor: AppColorManger.blueAppColor,
                    textDecoration: TextDecoration.underline,
                    fontSize: FontSizeManger.fs16,
                    color: AppColorManger.blueAppColor,
                    fontWeight: FontWeightManger.semiBoldWeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
