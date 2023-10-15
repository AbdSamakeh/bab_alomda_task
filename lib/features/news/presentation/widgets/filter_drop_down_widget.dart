import 'package:flutter/material.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/size_manger.dart';

class FilterDropDownWidget extends StatelessWidget {
  const FilterDropDownWidget({
    Key? key,
    required this.popubFilterType,
    this.onSelected,
  }) : super(key: key);
  final List<PopupMenuItem<FilterDropDown>> popubFilterType;
  final void Function(FilterDropDown)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<FilterDropDown>(
      icon: Icon(
        Icons.filter_alt_rounded,
        color: AppColorManger.backgroundAppColor,
        size: AppIconSizeManger.s8,
      ),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
      ),
      padding: EdgeInsets.zero,
      iconSize: AppIconSizeManger.s6,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => popubFilterType,
    );
  }
}

class FilterDropDown {
  final String filterName;
  final bool isSelected;
  FilterDropDown({
    required this.filterName,
    required this.isSelected,
  });
}
