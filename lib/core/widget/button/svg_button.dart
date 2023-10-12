import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//Clickable Svg Icons Widget
class SvgButton extends StatelessWidget {
  const SvgButton({
    Key? key,
    required this.iconAssetPath,
    this.onTap,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.shape,
    this.padding,
    this.margin,
    this.borderRadius,
  }) : super(key: key);
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final String iconAssetPath;
  final BoxShape? shape;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: backgroundColor,
            shape: shape ?? BoxShape.circle),
        padding: padding,
        child: SvgPicture.asset(
          iconAssetPath,
          color: color,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
