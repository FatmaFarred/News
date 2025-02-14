import 'package:News/category/newsdeatilsbottom%20sheet.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/category/Newsbuilder/News%20widget.dart';

class NewsBuilder extends StatefulWidget {
  Sources source ;
  int selectedindex=0;
  NewsBuilder ({required this .source});

  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}

class _NewsBuilderState extends State<NewsBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(future: ApiManeger.getnewsfromapiById(widget.source.id??""), builder: (context,snapshot){
      if (snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(color: AppColors.grey,),
        );
      }else if (snapshot.hasError){
        return Column(children: [
          Text("Something went wrong",style: Theme.of(context).textTheme.labelMedium),
          ElevatedButton(onPressed: (){
            ApiManeger.getnewsfromapiById(widget.source.id??"");
            setState(() {

            });
          }, child: Text("Try Again",style: Theme.of(context).textTheme.labelLarge))
        ],);
      }else if (snapshot.data!.status=="error"  ){
        return Column(children: [
          Text(snapshot.data!.message!,style: Theme.of(context).textTheme.labelMedium),
          ElevatedButton(onPressed: (){
            ApiManeger.getnewsfromapiById(widget.source.id??"");
            setState(() {

            });
          }, child: Text("Try Again",style: Theme.of(context).textTheme.labelLarge))
        ]);
      } else {
        var newslist = snapshot.data!.articles!;
        return ListView.builder(itemCount:newslist.length ,
            itemBuilder: (context,index){


          widget.selectedindex=index;
           return InkWell(onTap:(){
             displayNewsDetailsDropdownsheet(newslist[index].urlToImage??"", newslist[index].content??"",
                 newslist[index].url??""
             );
           },
               child: Newswidget(article: newslist[index]));

            });
      }
    }
    );
  }
  void displayNewsDetailsDropdownsheet(String url ,String content,String urlrticle) {
    showModalBottomSheet(context: context, builder:(context)=> NewsDetailsBottomSheet(content: content,urlImage:url ,urlrticle:urlrticle ,));
  }

}
