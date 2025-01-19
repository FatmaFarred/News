import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/Apptheme.dart';
import 'package:News/HomeScreen/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:News/category/categoryscreen.dart';
import 'package:News/provider/Theme%20provider.dart';
import 'package:News/provider/languageprovider.dart';
import 'package:provider/provider.dart';
import 'package:News/provider/languageprovider.dart';

void main() {

  runApp( 
      MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>Languageprovider()),
        ChangeNotifierProvider(create: (context)=>ThemeProvider(),)
      ],

          child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider= Provider.of<Languageprovider>(context);
    var themeProvider= Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.routeName,
      routes: {
        CategoryScreen.routeName:(context)=>CategoryScreen(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale(languageProvider.currentLanguage) ,
      darkTheme: AppTheme.darkTheme,
      theme:AppTheme.lightTheme ,
      themeMode:themeProvider.currentTheme ,


    );
  }
}