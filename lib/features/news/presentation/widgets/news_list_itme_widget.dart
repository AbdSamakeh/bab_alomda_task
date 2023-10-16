import 'package:flutter/material.dart';
import 'package:top_story_nyt/core/function/extention_functions.dart';
import 'package:top_story_nyt/core/widget/text/app_text_widget.dart';
import 'package:top_story_nyt/features/news/domain/entities/response/news_response_entite.dart';
import 'package:top_story_nyt/router/app_router.dart';

import '../../../../core/function/global_functions.dart';
import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/font_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/container/decorated_container.dart';
import '../../../../core/widget/image/main_image_widget.dart';

class NewsListItemWidget extends StatelessWidget {
  const NewsListItemWidget({
    Key? key,
    required this.newsItem,
  }) : super(key: key);
  final News newsItem;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      color: AppColorManger.white,
      child: InkWell(
        onTap: () => Navigator.pushNamed(
            context, RouteNamedScreens.newsDetailsNameRoutePage,
            arguments: newsItem),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Images
            Container(
              padding: EdgeInsets.all(AppWidthManger.w2),
              width: AppWidthManger.w30,
              height: AppWidthManger.w30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadiusManger.r3),
                child: MainImageWidget(
                  width: AppWidthManger.w30,
                  height: AppWidthManger.w30,
                  imageUrl: newsItem.multimedia[0].url,
                  borderRadius: BorderRadius.circular(AppRadiusManger.r3),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //Published Date, Title, Descreption And Section
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppWidthManger.w4, vertical: AppWidthManger.w2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Section Text
                    Align(
                      alignment: checkIfLTR(context: context)
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: AppTextWidget(
                        text: newsItem.section,
                        fontSize: FontSizeManger.fs14,
                        color: AppColorManger.secondaryAppColor,
                        fontWeight: FontWeightManger.boldWeight,
                      ),
                    ),
                    SizedBox(
                      height: AppHeightManger.h1,
                    ),
                    //News Title
                    AppTextWidget(
                      text: newsItem.title,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: AppColorManger.mainAppColor,
                      fontWeight: FontWeightManger.boldWeight,
                      fontSize: FontSizeManger.fs14,
                    ),
                    SizedBox(
                      height: AppHeightManger.h1,
                    ),
                    //Descreption Text
                    AppTextWidget(
                      maxLines: 2,
                      text: newsItem.resultAbstract,
                      fontSize: FontSizeManger.fs14,
                      color: AppColorManger.blackAppColor,
                    ),
                    SizedBox(
                      height: AppHeightManger.h1,
                    ),
                    //Published Time
                    Align(
                      alignment: checkIfLTR(context: context)
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: AppTextWidget(
                        text: newsItem.publishedDate.formatDate(),
                        color: AppColorManger.darkGreyAppColor,
                        fontWeight: FontWeightManger.semiBoldWeight,
                        fontSize: FontSizeManger.fs14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
