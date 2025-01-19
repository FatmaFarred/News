import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Languageprovider extends ChangeNotifier {
  String currentLanguage = 'en';

  Languageprovider (){
    getLanguage();
  }
  void changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) {
      return;
    }
    currentLanguage = newLanguage;
    saveLanguage(currentLanguage);
    notifyListeners();
  }

  Future<void> saveLanguage(String currentLanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("mylanguage", currentLanguage);
  }

  Future<void> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myLanguage = prefs.getString("mylanguage");
    if (myLanguage != null) {
      if (myLanguage == 'en') {
        currentLanguage = 'en';
      } else {
        currentLanguage = 'ar';
      }
      notifyListeners();
    }
  }
}