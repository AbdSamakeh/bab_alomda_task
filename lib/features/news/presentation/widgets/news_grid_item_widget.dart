import 'package:flutter/material.dart';
import '../../../../core/function/extention_functions.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entities/response/news_response_entite.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/font_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/container/decorated_container.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../router/app_router.dart';

class NewsGridItemWidget extends StatelessWidget {
  const NewsGridItemWidget({
    Key? key,
    required this.newsItem,
  }) : super(key: key);
  final News newsItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
          context, RouteNamedScreens.newsDetailsNameRoutePage,
          arguments: newsItem),
      child: DecoratedContainer(
        color: AppColorManger.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Images
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadiusManger.r3),
                child: MainImageWidget(
                  width: AppWidthManger.w100,
                  height: AppWidthManger.w30,
                  imageUrl: newsItem.multimedia[0].url,
                  borderRadius: BorderRadius.circular(AppRadiusManger.r3),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //Published Date, Title, Descreption And Section
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppWidthManger.w4, vertical: AppWidthManger.w2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //News Title
                  AppTextWidget(
                    text: newsItem.title,
                    softWrap: true,
                    maxLines: 3,
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: newsItem.resultAbstract,
                    fontSize: FontSizeManger.fs14,
                    color: AppColorManger.blackAppColor,
                  ),
                  SizedBox(
                    height: AppHeightManger.h1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Section Text
                      AppTextWidget(
                        text: newsItem.section,
                        fontSize: FontSizeManger.fs14,
                        color: AppColorManger.secondaryAppColor,
                        fontWeight: FontWeightManger.boldWeight,
                      ),
                      //Published Time
                      AppTextWidget(
                        text: newsItem.publishedDate.formatDate(),
                        color: AppColorManger.darkGreyAppColor,
                        fontWeight: FontWeightManger.semiBoldWeight,
                        fontSize: FontSizeManger.fs14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
