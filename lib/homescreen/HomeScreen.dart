import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/APP%20Utilies/fonts.dart';
import 'package:News/HomeScreen/Drawer.dart';
import 'package:News/HomeScreen/category%20model.dart';
import 'package:News/provider/Theme%20provider.dart';
import 'package:News/provider/languageprovider.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';


class HomeScreen extends StatelessWidget {

  List<CategoryModel>categoryList=[];
  Function onToggleClick;

  HomeScreen ({required this.onToggleClick});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<Languageprovider>(context);
    categoryList=CategoryModel.getCategoryModelList(context);

    var height=MediaQuery.of(context).size.height;
    var width=   MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text (AppLocalizations.of(context)!.goodmorning,style:Theme.of(context).textTheme.titleMedium ,),
        Text (AppLocalizations.of(context)!.hereissomwnewsforyou,style:Theme.of(context).textTheme.titleMedium ,),
          Expanded(child: ListView.separated(itemCount:   categoryList.length,
              itemBuilder: (context, listindex){
             return Container(clipBehavior: Clip.antiAlias,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
               child: Stack(alignment:listindex%2==0?Alignment.bottomRight:Alignment.bottomLeft,
               children: [Image.asset(categoryList[listindex].Image),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal:width*0.04,vertical: height*0.02),
                 child: ToggleSwitch(
                   customWidths: listindex%2==0?[width*0.28 ,width*0.14]:[width*0.14,width*0.28 ,],
                   cornerRadius: 20.0,
                   customWidgets: listindex%2==0?[Text(AppLocalizations.of(context)!.viewall,style:  themeProvider.currentTheme == ThemeMode.light?AppFontStyles.balck20medium:AppFontStyles.white20medium,),
                   CircleAvatar(backgroundColor: Theme.of(context).primaryColor,
                     child:Icon(Icons.arrow_forward_ios,color:Theme.of(context).indicatorColor ,) ,
                   )
                   ]:[CircleAvatar(backgroundColor: Theme.of(context).primaryColor,
                     child:Icon(Icons.arrow_back_ios_new,color:Theme.of(context).indicatorColor ,) ,
                   ),Text(AppLocalizations.of(context)!.viewall,style:  themeProvider.currentTheme == ThemeMode.light?AppFontStyles.balck20medium:AppFontStyles.white20medium,),

                   ]
                   ,
                   activeBgColors:listindex%2==0?[[Theme.of(context).primaryColor], [AppColors.grey]]:[[AppColors.grey],[Theme.of(context).primaryColor], ],
                   activeFgColor: Colors.black,
                   inactiveBgColor: Colors.grey,
                   inactiveFgColor: Colors.white,
                   initialLabelIndex:listindex%2==0? 1:0,
                   totalSwitches: 2,
                   radiusStyle: false,
                   animate: true,
                   onToggle: (index) {
                     print('switched to: $index');

                     onToggleClick (categoryList[listindex]);
                     print('switched to: $listindex');


                   },
                 ),
               ),
             ],),);
          },
          separatorBuilder: (context,index ){

                return SizedBox(height: height*0.02,);
          },

          )

          )



      ],
      ),
    );
  }
}
