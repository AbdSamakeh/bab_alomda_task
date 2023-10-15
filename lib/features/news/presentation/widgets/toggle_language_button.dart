import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_story_nyt/core/storage/shared/shared_pref.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/font_manger.dart';
import '../../../../core/resource/key_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../router/app_router.dart';

class ToggleLanguageButton extends StatelessWidget {
  const ToggleLanguageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (EasyLocalization.of(context)?.currentLocale?.languageCode !=
            AppKeyManger.arabicLocalizationCode) {
          await EasyLocalization.of(context)!
              .setLocale(const Locale(AppKeyManger.arabicLocalizationCode));
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNamedScreens.splashNameRoutePage, (route) => false);
        } else {
          await EasyLocalization.of(context)!
              .setLocale(const Locale(AppKeyManger.englishLocalizationCode));
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNamedScreens.splashNameRoutePage, (route) => false);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: AppSharedPreferences.getLanguage() ==
                AppKeyManger.arabicLocalizationCode,
            replacement: AppTextWidget(
              text: 'Arabic',
              fontSize: FontSizeManger.fs20,
              color: AppSharedPreferences.getCashedThemeMode()
                  ? AppColorManger.black
                  : AppColorManger.white,
            ),
            child: AppTextWidget(
              text: 'English',
              fontSize: FontSizeManger.fs20,
              color: AppSharedPreferences.getCashedThemeMode()
                  ? AppColorManger.black
                  : AppColorManger.white,
            ),
          ),
          Icon(
            Icons.translate,
            size: AppIconSizeManger.s8,
          ),
        ],
      ),
    );
  }
}
