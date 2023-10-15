import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/container/decorated_container.dart';

class LoadingNewsGridItemWidget extends StatelessWidget {
  const LoadingNewsGridItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      color: AppColorManger.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Loading Image And Favorite Button
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColorManger.shimmerBaseColor,
              highlightColor: AppColorManger.shimmerHighlightColor,
              child: Container(
                height: AppWidthManger.w30,
                decoration: BoxDecoration(
                    color: AppColorManger.white,
                    borderRadius: BorderRadius.circular(AppRadiusManger.r3)),
              ),
            ),
          ),
          //Loading Published Date, Title, Descreption And Section
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppWidthManger.w4, vertical: AppWidthManger.w2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Loading News Title
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
                //Loading Descreption Text
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Loading Section Text
                    Shimmer.fromColors(
                      baseColor: AppColorManger.shimmerBaseColor,
                      highlightColor: AppColorManger.shimmerHighlightColor,
                      child: Container(
                        color: AppColorManger.white,
                        width: AppWidthManger.w12,
                        height: AppHeightManger.h1,
                      ),
                    ),
                    //Loading Published Time
                    Shimmer.fromColors(
                      baseColor: AppColorManger.shimmerBaseColor,
                      highlightColor: AppColorManger.shimmerHighlightColor,
                      child: Container(
                        color: AppColorManger.white,
                        width: AppWidthManger.w12,
                        height: AppHeightManger.h1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
