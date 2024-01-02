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
        contentPadding: const EdgeInsets.only(left: 10,right: 20),
        focusColor: Colors.blue,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        fillColor:Colors.white,
        hintStyle: const TextStyle(color: kGreyColor),
        errorStyle: const TextStyle(color: Colors.red),
        // errorBorder: outlineInputBorder,
        labelStyle:  const TextStyle(color:kBlackColor,fontSize: 12.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kMainColor),
          borderRadius: BorderRadius.circular(8),

        ),
        focusedErrorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputActiveBorder,
        errorBorder: outlineInputBorder,
        // contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      ),
    );
  }
}
final OutlineInputBorder outlineInputActiveBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide:   const BorderSide(color: kMainColor,width: 2), // Green border color
);
final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kMainColor,width: 1));