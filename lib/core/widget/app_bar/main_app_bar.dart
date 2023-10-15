// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:top_story_nyt/core/widget/text/app_text_widget.dart';

import '../../resource/color_manger.dart';
import '../../resource/size_manger.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.leadingWidth,
    this.automaticallyImplyLeading,
    this.roundedShape,
    this.centerTitle,
    this.elevation,
    this.actions,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final double? leadingWidth;
  final bool? automaticallyImplyLeading;
  final bool? roundedShape;
  final bool? centerTitle;
  final double? elevation;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColorManger.white, // set the color of the icon
      ),
      leading: leading,
      actions: actions,
      leadingWidth: leadingWidth,
      title: AppTextWidget(
        text: title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: centerTitle ?? false,
      elevation: elevation ?? 0,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      shape: roundedShape == true
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppRadiusManger.r3),
              ),
            )
          : null,
    );
  }

  //Hight Of App Bar
  @override
  Size get preferredSize => Size.fromHeight(AppHeightManger.h8);
}