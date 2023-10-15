import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/function/global_functions.dart';
import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/container/decorated_container.dart';

class LoadingNewsListItemWidget extends StatelessWidget {
  const LoadingNewsListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image And Favorite Button
          Container(
            padding: EdgeInsets.all(AppWidthManger.w2),
            width: AppWidthManger.w30,
            height: AppWidthManger.w30,
            child: Shimmer.fromColors(
                baseColor: AppColorManger.shimmerBaseColor,
                highlightColor: AppColorManger.shimmerHighlightColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColorManger.white,
                      borderRadius: BorderRadius.circular(AppRadiusManger.r3)),
                )),
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
                  //Section Text Shimmer
                  Align(
                    alignment: checkIfLTR(context: context)
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Shimmer.fromColors(
                      baseColor: AppColorManger.shimmerBaseColor,
                      highlightColor: AppColorManger.shimmerHighlightColor,
                      child: Container(
                        color: AppColorManger.white,
                        width: AppWidthManger.w28,
                        height: AppHeightManger.h1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppHeightManger.h1,
                  ),
                  //News Title Shimmer
                  Shimmer.fromColors(
                    baseColor: AppColorManger.shimmerBaseColor,
                    highlightColor: AppColorManger.shimmerHighlightColor,
                    child: Container(
                      color: AppColorManger.white,
                      width: AppWidthManger.w28,
                      height: AppHeightManger.h1,
                    ),
                  ),
                  SizedBox(
                    height: AppHeightManger.h1,
                  ),
                  //Descreption Text
                  Shimmer.fromColors(
                    baseColor: AppColorManger.shimmerBaseColor,
                    highlightColor: AppColorManger.shimmerHighlightColor,
                    child: Container(
                      color: AppColorManger.white,
                      width: AppWidthManger.w60,
                      height: AppHeightManger.h5,
                    ),
                  ),
                  SizedBox(
                    height: AppHeightManger.h1,
                  ),
                  //Published Time
                  Align(
                    alignment: checkIfLTR(context: context)
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Shimmer.fromColors(
                      baseColor: AppColorManger.shimmerBaseColor,
                      highlightColor: AppColorManger.shimmerHighlightColor,
                      child: Container(
                        color: AppColorManger.white,
                        width: AppWidthManger.w28,
                        height: AppHeightManger.h1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
