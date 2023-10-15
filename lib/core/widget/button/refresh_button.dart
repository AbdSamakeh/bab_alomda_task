// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resource/color_manger.dart';
import '../../resource/font_manger.dart';
import '../../resource/size_manger.dart';
import '../text/app_text_widget.dart';
import 'main_app_button.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    Key? key,
    required this.refreshTitle,
    this.haveRefreshButton,
    this.onTap,
  }) : super(key: key);
  final String refreshTitle;
  final bool? haveRefreshButton;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppWidthManger.w4),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextWidget(
            textAlign: TextAlign.center,
            text: refreshTitle,
            fontSize: FontSizeManger.fs20,
            overflow: TextOverflow.visible,
            fontWeight: FontWeightManger.semiBoldWeight,
            color: AppColorManger.redAppColor,
          ),
          SizedBox(
            height: AppHeightManger.h2,
          ),
          haveRefreshButton == false
              ? const SizedBox()
              : MainAppButton(
                  width: AppWidthManger.w30,
                  height: AppHeightManger.h5,
                  alignment: Alignment.center,
                  onTap: onTap,
                  child: AppTextWidget(
                    text: LocaleKeys.refresh.tr(),
                    color: AppColorManger.white,
                    fontSize: FontSizeManger.fs16,
                  ),
                ),
        ],
      ),
    );
  }
}
