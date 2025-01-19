import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:News/APP%20Utilies/Apptheme.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/APP%20Utilies/assets.dart';
import 'package:News/APP%20Utilies/fonts.dart';
import 'package:News/HomeScreen/HomeScreen.dart';
import 'package:News/provider/Theme%20provider.dart';
import 'package:News/provider/languageprovider.dart';
import 'package:provider/provider.dart';


class DrawerContent extends StatefulWidget {
  Function OngohomeClick;
  DrawerContent ({required this.OngohomeClick});
  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<ThemeProvider>(context);
    var languageProvider= Provider.of<Languageprovider>(context);

    String selectedTheme=themeProvider.currentTheme==ThemeMode.light?AppLocalizations.of(context)!.light: AppLocalizations.of(context)!.dark;
    String selectedLanguage=languageProvider.currentLanguage=="en"?AppLocalizations.of(context)!.english: AppLocalizations.of(context)!.arabic;
    var height=MediaQuery.of(context).size.height;
    var width=   MediaQuery.of(context).size.width;

    return  Column( crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Container(height: height*0.19,
          padding: EdgeInsets.symmetric(horizontal:width*0.16,vertical: height*0.07),
        color: AppColors.white,
        child: Text(AppLocalizations.of(context)!.newsapp,style: AppFontStyles.balck24bold)),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:height*0.02,horizontal: width*0.04),
          child: InkWell(onTap: (){
            widget.OngohomeClick();
          },
            child: Row(
              children: [ImageIcon(AssetImage(Assets.homeicon),color: AppColors.white,),
              SizedBox(width: width*0.02,),
              Text(AppLocalizations.of(context)!.gotohome,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.white))

            ],),
          ),

        ),
        Divider(height: height *0.02,indent: width *0.04,endIndent:width *0.04 ,),
        Padding(
          padding:  EdgeInsets.only(top: height*0.02,left: width*0.04,bottom: height*0.01 ),
          child: Row(
            children: [ImageIcon(AssetImage(Assets.themeicon),color: AppColors.white,),
              SizedBox(width: width*0.02,),
              Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.white))

            ],),


        ),

        Container( margin: EdgeInsets.only(top: height*0.01,left: width*0.04,bottom: height*0.02,right:  width*0.04 ) ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.all(color: AppColors.white)),
          child: DropdownButton(
              padding:EdgeInsets.only(left: width*0.04) ,
            underline: SizedBox(),dropdownColor: AppColors.grey,
              style: AppFontStyles.white20medium,

              isExpanded:true,iconEnabledColor: AppColors.white,borderRadius: BorderRadius.circular(16),
              value: selectedTheme,
              items: [DropdownMenuItem(value:AppLocalizations.of(context)!.light ,
              child:Text( AppLocalizations.of(context)!.light)),DropdownMenuItem(value:AppLocalizations.of(context)!.dark ,
              child: Text( AppLocalizations.of(context)!.dark))], onChanged: (mode){
            if (mode == AppLocalizations.of(context)!.light) {
              themeProvider.changeTheme(ThemeMode.light);
            } else if (mode == AppLocalizations.of(context)!.dark) {
              themeProvider.changeTheme(ThemeMode.dark);
            }
            setState(() {
          
            });
          }),

        ),
        Divider(height: height *0.02,indent: width *0.04,endIndent:width *0.04 ,),
        Padding(
          padding:  EdgeInsets.only(top: height*0.02,left: width*0.04,bottom: height*0.01 ),
          child: Row(
            children: [ImageIcon(AssetImage(Assets.languageicon),color: AppColors.white,),
              SizedBox(width: width*0.02,),
              Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.white))

            ],),


        ),

        Container( margin: EdgeInsets.only(top: height*0.01,left: width*0.04,bottom: height*0.01,right:  width*0.04 ) ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.all(color: AppColors.white)),
          child: DropdownButton(
              padding:EdgeInsets.only(left: width*0.04) ,
              underline: SizedBox(),dropdownColor: AppColors.grey,
              style: AppFontStyles.white20medium,

              isExpanded:true,iconEnabledColor: AppColors.white,borderRadius: BorderRadius.circular(16),
              value: selectedLanguage,
              items: [DropdownMenuItem(value:AppLocalizations.of(context)!.english ,
                  child:Text( AppLocalizations.of(context)!.english)),DropdownMenuItem(value:AppLocalizations.of(context)!.arabic ,
                  child: Text( AppLocalizations.of(context)!.arabic))], onChanged: (language){
            if (language == AppLocalizations.of(context)!.english) {
             languageProvider.changeLanguage("en");
            } else if (language == AppLocalizations.of(context)!.arabic) {
              languageProvider.changeLanguage("ar");
            }
            setState(() {

            });
          }),

        )


      ],

    );
  }
}
