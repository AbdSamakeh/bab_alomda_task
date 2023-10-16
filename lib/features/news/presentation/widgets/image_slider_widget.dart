// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_story_nyt/core/resource/color_manger.dart';
import 'package:top_story_nyt/core/resource/size_manger.dart';
import 'package:top_story_nyt/core/storage/shared/shared_pref.dart';

import '../../../../core/widget/image/main_image_widget.dart';
import '../../domain/entities/response/news_response_entite.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({
    Key? key,
    required this.multimedia,
  }) : super(key: key);
  final List<Multimedia> multimedia;

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  CarouselController controller = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppHeightManger.h2,
        ),
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: AppWidthManger.w70,
            autoPlay: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              setState(
                () {
                  currentIndex = index;
                },
              );
            },
          ),
          items: widget.multimedia.map((item) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(AppRadiusManger.r3),
              child: MainImageWidget(
                imageUrl: item.url,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: AppHeightManger.h2,
        ),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: widget.multimedia.length,
          onDotClicked: (index) {
            controller.animateToPage(index);
          },
          effect: WormEffect(
              activeDotColor: AppSharedPreferences.getCashedThemeMode()
                  ? AppColorManger.mainAppColor
                  : AppColorManger.secondaryAppColor,
              dotColor: AppColorManger.greyAppColor),
        )
      ],
    );
  }
}
