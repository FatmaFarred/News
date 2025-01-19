import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/APP%20Utilies/fonts.dart';

class AppTheme{
  static final ThemeData lightTheme=ThemeData(
      primaryColor: AppColors.white,

      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: AppFontStyles.balck20medium,
        iconTheme:IconThemeData(color: AppColors.black)

      ),


      scaffoldBackgroundColor: AppColors.white,
      indicatorColor:AppColors.black,

      textTheme: TextTheme(
          headlineMedium: AppFontStyles.balck20medium,
          headlineLarge: AppFontStyles.balck20bold,
          titleLarge: AppFontStyles.balck24bold,
          labelLarge: AppFontStyles.balck16bold,labelMedium:AppFontStyles.balck14medium,
          titleMedium: AppFontStyles.balck24medium
      )


  );

static final ThemeData darkTheme=ThemeData(
  primaryColor: AppColors.black,

    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,

        centerTitle: true,
        titleTextStyle: AppFontStyles.white20medium,
        iconTheme:IconThemeData(color: AppColors.white)

    ),


    scaffoldBackgroundColor: AppColors.black,
    indicatorColor:AppColors.white,

    textTheme: TextTheme(
      headlineMedium: AppFontStyles.white20medium,
      headlineLarge: AppFontStyles.white20bold,
      titleLarge: AppFontStyles.white24bold,
      labelLarge: AppFontStyles.white16bold,labelMedium:AppFontStyles.white14medium,
        titleMedium: AppFontStyles.white24medium

    )


);

}