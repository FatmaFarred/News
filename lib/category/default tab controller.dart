import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/category/Newsbuilder/news%20builder.dart';
import 'package:News/category/default%20tab%20widget.dart';

class CategoryDefaultTabController  extends StatefulWidget {

  List<Sources>sourcesList;
  CategoryDefaultTabController ({required this.sourcesList});

  @override
  State<CategoryDefaultTabController> createState() => _CategoryDefaultTabControllerState();
}

class _CategoryDefaultTabControllerState extends State<CategoryDefaultTabController> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=   MediaQuery.of(context).size.width;

    return DefaultTabController(
        length: widget.sourcesList.length,
        child:Column(
          children: [
            TabBar(onTap: (index){
              selectedIndex=index;
              setState(() {

              });

            },
                isScrollable: true,
                indicatorColor: Theme.of(context).indicatorColor,
                dividerColor: AppColors.transparent,
                tabAlignment: TabAlignment.start,
                tabs: widget.sourcesList.map((source){
              return DefaultTabWdget(sources: source, isSelected: selectedIndex==widget.sourcesList.indexOf(source)
              );
            }).toList()),
            SizedBox(height: height*0.04 ,),
            Expanded(child: NewsBuilder(source: widget.sourcesList[selectedIndex]))
          ],
        ) );
  }
}
