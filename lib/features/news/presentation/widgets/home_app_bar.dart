// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:top_story_nyt/core/function/global_functions.dart';

import 'package:top_story_nyt/core/widget/text/app_text_widget.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/icon_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/button/svg_button.dart';
import '../../../../core/widget/form_filed/app_form_filed.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar(
      {Key? key,
      required this.title,
      this.leadingWidth,
      this.automaticallyImplyLeading,
      this.roundedBottomShape,
      this.centerTitle,
      this.elevation,
      required this.isGridView,
      this.bottom,
      this.onChangedSearch,
      this.onSearchSubmited,
      this.onPressedAction,
      this.onPressedFilterButton,
      required this.filtterWidget,
      this.searchEnabled})
      : super(key: key);
  final String title;
  final double? leadingWidth;
  final bool? automaticallyImplyLeading;
  final bool? roundedBottomShape;
  final bool? centerTitle;
  final bool? searchEnabled;
  final double? elevation;
  final bool isGridView;
  final PreferredSizeWidget? bottom;
  final String? Function(String?)? onChangedSearch;
  final String? Function(String?)? onSearchSubmited;
  final void Function()? onPressedAction;
  final void Function()? onPressedFilterButton;
  final Widget filtterWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: AppWidthManger.w2,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: SvgButton(
          color: AppColorManger.backgroundAppColor,
          iconAssetPath: AppIconManger.listIcon,
          width: AppIconSizeManger.s4,
          height: AppIconSizeManger.s4,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColorManger.white, // set the color of the icon
      ),
      actions: [
        //Switch List Style Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidthManger.w2),
          child: Visibility(
            visible: isGridView,
            //List View Icon
            replacement: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressedAction,
              icon: Icon(
                Icons.list_rounded,
                size: AppIconSizeManger.s8,
              ),
              color: AppColorManger.backgroundAppColor,
            ),
            //Grid View Icon
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressedAction,
              icon: SvgButton(
                color: AppColorManger.backgroundAppColor,
                iconAssetPath: AppIconManger.categoryIcon,
                width: AppIconSizeManger.s6,
                height: AppIconSizeManger.s6,
              ),
            ),
          ),
        )
      ],
      leadingWidth: leadingWidth,
      title: AppTextWidget(
        text: title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      elevation: elevation ?? 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        //Search Filed And Option Button
        child: Padding(
          padding: EdgeInsets.only(
              bottom: AppHeightManger.h2,
              left: checkIfLTR(context: context)
                  ? AppWidthManger.w4
                  : AppWidthManger.w2,
              right: AppWidthManger.w2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Search Filed
              Flexible(
                child: SizedBox(
                  height: AppHeightManger.h5,
                  child: AppTextFormField(
                    enabled: searchEnabled,
                    hintText: LocaleKeys.search.tr(),
                    textInputType: TextInputType.name,
                    onChanged: onChangedSearch,
                    onFilledSubmited: onSearchSubmited,
                    textInputAction: TextInputAction.search,
                    expand: true,
                    autoFoucs: false,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: AppIconSizeManger.s8,
                      color: AppColorManger.greyAppColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppWidthManger.w2,
              ),
              //Filtter Button
              filtterWidget
            ],
          ),
        ),
      ),
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

  //Height Of App Bar
  @override
  Size get preferredSize => Size.fromHeight(AppHeightManger.h16);
}
