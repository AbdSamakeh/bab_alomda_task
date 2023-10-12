import 'package:flutter/material.dart';

import '../../resource/color_manger.dart';
import '../../resource/font_manger.dart';

//Deafult App Text Form Filed
class AppTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFilledSubmited;
  final Function()? editingComplete;
  final String? Function(String?)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final FocusNode? focusNode;
  final String? labelText;
  final String? initialValue;
  final Color? textColor;
  final Color? labelColor;
  final int? maxLines;
  final Widget? prefixIcon;
  final String? hintText;
  final bool? outlinedBorder;
  final bool? expand;
  final bool? autoFoucs;
  final EdgeInsetsGeometry? contentPadding;
  const AppTextFormField(
      {Key? key,
      this.enabled,
      this.suffixIcon,
      this.fillColor,
      this.expand,
      this.contentPadding,
      this.controller,
      this.obscureText,
      this.autoFoucs,
      this.validator,
      this.editingComplete,
      this.onChanged,
      this.textInputType,
      this.textInputAction,
      this.focusNode,
      this.labelText,
      this.textColor = AppColorManger.textAppColor,
      this.labelColor = AppColorManger.greyAppColor,
      this.onFilledSubmited,
      this.initialValue,
      this.maxLines,
      this.prefixIcon,
      this.hintText,
      this.outlinedBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFilledSubmited,
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      autofocus: autoFoucs ?? false,
      onEditingComplete: editingComplete,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      initialValue: initialValue,
      enabled: enabled,
      expands: expand ?? false,
      decoration: InputDecoration(
        fillColor: fillColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: FontSizeManger.fs16,
          fontWeight: FontWeight.bold,
        ),
        errorStyle: TextStyle(
          fontSize: FontSizeManger.fs14,
        ),
      ),
      style: TextStyle(
          color: AppColorManger.textAppColor,
          fontSize: FontSizeManger.fs16,
          fontFamily: FontFamilyManager.cairo),
    );
  }
}
