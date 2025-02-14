
import 'package:News/APP%20Utilies/Apptheme.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/APP%20Utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Theme provider.dart';
import '../provider/language provider.dart';


class CustomeElevatedButtom extends StatelessWidget {

 Color? color;
 String text;
 Widget? IconImage;
 TextStyle? style;
 Function ? onpressed;
 CustomeElevatedButtom ({this.color, required this.text, this.IconImage, this.style, this.onpressed});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<Languageprovider>(context);
    return  ElevatedButton(

        style: ElevatedButton.styleFrom(elevation: 0,
            padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.04),
            shape: RoundedRectangleBorder(side: BorderSide(color:Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(16)),backgroundColor:color ?? Theme.of(context).primaryColor),
        onPressed: () { //NAVIGATION
          if (onpressed != null) {
            onpressed!();
          };

        },
        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          IconImage ??SizedBox(),
          SizedBox(width: width*0.01,),
          Text(text,style:style ??AppFontStyles.white20bold ,)

        ],)
    );
  }
}
