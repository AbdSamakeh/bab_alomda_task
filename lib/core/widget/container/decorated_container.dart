import 'package:flutter/material.dart';

import '../../resource/color_manger.dart';
import '../../resource/size_manger.dart';

//A Decorated Container With Deafult Shadow Effect
class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    Key? key,
    this.color,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.child,
    this.border,
    this.alignment,
    this.shape,
    this.boxShadow,
    this.image,
    this.borderRadius,
    this.isGradient,
  }) : super(key: key);
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Widget? child;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;
  final DecorationImage? image;
  final BorderRadiusGeometry? borderRadius;
  final bool? isGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment,
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: isGradient != null
            ? const LinearGradient(
                colors: [AppColorManger.white, AppColorManger.mainAppColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        border: border,
        image: image,
        borderRadius: shape == BoxShape.circle
            ? null
            : borderRadius ?? BorderRadius.circular(AppRadiusManger.r4),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.grey.withOpacity(0.45),
                spreadRadius: 0,
                blurRadius: 3,
                offset:
                    // changes position of shadow
                    const Offset(0, 0),
              ),
            ],
        shape: shape ?? BoxShape.rectangle,
        color: color ?? AppColorManger.white,
      ),
      child: child,
    );
  }
}
