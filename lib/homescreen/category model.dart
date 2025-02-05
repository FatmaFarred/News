import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/assets.dart';
import 'package:News/provider/Theme%20provider.dart';
import 'package:provider/provider.dart';

class CategoryModel {
  String id;
  String Image;
  String sourceTitle;

  CategoryModel(
      {required this.id, required this.Image, required this.sourceTitle});

  static List<CategoryModel> getCategoryModelList(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return [
      CategoryModel(
          id: 'general',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.generallight
              : Assets.generaldark,
          sourceTitle: "General"),
      CategoryModel(
          id: 'business',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.businesslight
              : Assets.businessdark,
          sourceTitle: "Business"),
      CategoryModel(
          id: 'sports',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.sportslight
              : Assets.sportsdark,
          sourceTitle: "Sports"),
      CategoryModel(
          id: 'technology',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.technologylight
              : Assets.technologydark,
          sourceTitle: "Technology"),
      CategoryModel(
          id: 'entertainment',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.entertainmentlight
              : Assets.entertainmentdark,
          sourceTitle: "Entertainment"),
      CategoryModel(
          id: 'health',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.healthlight
              : Assets.healthdark,
          sourceTitle: "Health"),
      CategoryModel(
          id: 'science',
          Image: themeProvider.currentTheme == ThemeMode.light
              ? Assets.sciencelight
              : Assets.sciencedark,
          sourceTitle: "Science"),




    ];
  }
}
