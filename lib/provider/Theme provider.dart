import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentTheme =ThemeMode.light;

  ThemeProvider (){
   getTheme();
  }
  void changeTheme (ThemeMode newTheme){
    if (currentTheme==newTheme){
      return;
    }
    currentTheme=newTheme;
    saveTheme(currentTheme);
    notifyListeners();
  }
  Future<void> saveTheme(ThemeMode currenttheme)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("MyTheme", currenttheme==ThemeMode.light?"light":"dark");
  }
 Future <void> getTheme()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   String? MyAPPTheme=prefs.getString("MyTheme");
   if (MyAPPTheme!=null){
     if (MyAPPTheme=="light"){
       currentTheme=ThemeMode.light;
     }else {
       currentTheme=ThemeMode.dark;
     }
     notifyListeners();
   }

 }
}