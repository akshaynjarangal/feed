import 'package:feed/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  BuildContext context, {
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w100,
        ),
    contentPadding: const EdgeInsets.all(16),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.foreground, width: 0.42),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.foreground, width: 0.42),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.foreground, width: 0.42),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    hintText: hintText,
  );
}

InputDecorationTheme dropDownDecoration() {
  return const InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.foreground,
      fontWeight: FontWeight.w100,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 0,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.foreground, width: 0.42),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.foreground, width: 0.42),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.foreground, width: 0.42),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}
