import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/font_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/theme/theme_cubit/theme_cubit.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../generated/locale_keys.g.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<ThemeCubit>().toggleTheme();
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: state.isLightMode,
                replacement: AppTextWidget(
                  text: LocaleKeys.lightMode.tr(),
                  fontSize: FontSizeManger.fs20,
                  color: AppColorManger.white,
                ),
                child: AppTextWidget(
                  text: LocaleKeys.darkMode.tr(),
                  fontSize: FontSizeManger.fs20,
                  color: AppColorManger.black,
                ),
              ),
              Visibility(
                visible: !state.isLightMode,
                replacement: Icon(
                  Icons.dark_mode,
                  size: AppIconSizeManger.s8,
                ),
                child: Icon(
                  Icons.light_mode,
                  size: AppIconSizeManger.s8,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
