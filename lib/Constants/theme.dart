import 'package:flutter/material.dart';
import 'colors.dart';


class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: background,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: kPrimaryColor,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.w600, ),
          minimumSize: const Size(double.infinity, 55),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side:  BorderSide(color: kPrimaryColor),
          backgroundColor: background,
          foregroundColor: kWhiteColor,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: kBlackColor, fontWeight: FontWeight.w600, ),
          minimumSize: const Size(double.infinity, 55),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: outlineB),
          borderRadius: BorderRadius.circular(8),

        ),
        focusedBorder: outlineInputActiveBorderBlue,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: outlineB),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: outlineB),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
    );
  }
}
final OutlineInputBorder outlineInputActiveBorderBlue = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide:   BorderSide(color: outlineB, width: 2), // Green border color
);
final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: outlineB));