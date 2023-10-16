import 'package:flutter/material.dart';
import 'toggle_language_button.dart';
import 'toggle_theme_button.dart';

import '../../../../core/resource/size_manger.dart';

class NewsDrawerWidget extends StatelessWidget {
  const NewsDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidthManger.w4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ToggleThemeButton(),
            SizedBox(
              height: AppHeightManger.h2,
            ),
            const ToggleLanguageButton()
          ],
        ),
      ),
    );
  }
}
