import 'package:News/category/Newsbuilder/search%20tab.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/HomeScreen/Drawer.dart';
import 'package:News/HomeScreen/HomeScreen.dart';
import 'package:News/HomeScreen/category%20model.dart';
import 'package:News/category/categorytabs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryScreen extends StatefulWidget {
 static String routeName= "CategoryScreen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
     var width=   MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(title:selectedCategory==null? Text(AppLocalizations.of(context)!.general):Text (selectedCategory!.sourceTitle),
        actions: [IconButton(onPressed: (){
          Navigator.of(context).pushNamed(searchTab.routeName);


        }, icon: Icon(Icons.search_sharp))],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical:height*0.04 ),
        child: selectedCategory==null?HomeScreen(onToggleClick:OnToggleClick ,):CategoryTabs(Categgory: selectedCategory!,),

      ),
      drawer: Drawer( width: width*0.68,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.zero),
        backgroundColor: AppColors.black,
        child:DrawerContent(OngohomeClick:OngohomeClick ,),),




    );
  }

  CategoryModel? selectedCategory;

  OnToggleClick(CategoryModel newSelectedCategory) {
    selectedCategory=newSelectedCategory;
    print (selectedCategory!.id);
    setState(() {

    });
  }


  OngohomeClick() {
    selectedCategory=null;
    Navigator.of(context).pop();
    setState(() {

    });
  }
}
