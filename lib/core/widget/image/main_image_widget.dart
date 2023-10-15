import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../resource/image_manger.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) => Image.asset(
          AppImageManger.placeHolderImage,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Image.asset(
          AppImageManger.errorHolderImage,
          fit: BoxFit.cover,
        ),
        placeholderFadeInDuration: const Duration(seconds: 2),
      );
  }
}
