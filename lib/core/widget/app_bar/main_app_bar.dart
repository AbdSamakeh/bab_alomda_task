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
    this.roundedBottomShape,
    this.centerTitle,
    this.elevation,
    this.bottom,
    this.actions,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final double? leadingWidth;
  final bool? automaticallyImplyLeading;
  final bool? roundedBottomShape;
  final bool? centerTitle;
  final double? elevation;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

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
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      bottom: bottom,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      shape: roundedBottomShape == true
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppRadiusManger.r3),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppHeightManger.h6);
}
