import 'package:flutter/material.dart';

import 'svg_button.dart';

import '../../resource/color_manger.dart';
import '../../resource/size_manger.dart';

//! Options Button Like Qr Code And Calendar Button
class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    this.svgAsset,
    this.width,
    this.height,
    this.iconWidth,
    this.iconHeight,
    this.child,
    this.onTap,
  }) : super(key: key);
  final String? svgAsset;
  final double? width;
  final double? height;
  final double? iconWidth;
  final double? iconHeight;
  final Widget? child;
  final void Function()? onTap;
  //TODO: Option Button
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width ?? AppWidthManger.w12,
          height: height ?? AppWidthManger.w12,
          decoration: BoxDecoration(
            color: AppColorManger.darkGreyAppColor,
            borderRadius: BorderRadius.circular(
              AppRadiusManger.r3,
            ),
          ),
          alignment: Alignment.center,
          child: svgAsset != null && svgAsset!.isNotEmpty
              ? SvgButton(
                  iconAssetPath: svgAsset!,
                  width: iconWidth,
                  height: iconHeight,
                )
              : child),
    );
  }
}
