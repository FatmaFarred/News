import 'package:News/category/Newsbuilder/News%20view%20model.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/category/Newsbuilder/News%20widget.dart';
import 'package:provider/provider.dart';

class NewsBuilder extends StatefulWidget {
  Sources source ;
  NewsBuilder ({required this .source});

  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}

class _NewsBuilderState extends State<NewsBuilder> {
  NewsViewModel newsViewModel =NewsViewModel ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsViewModel.getNewsFromApi(widget.source.id);
    print (widget.source.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>newsViewModel,
    child: Consumer<NewsViewModel>(builder: (context,newsViewModel,child){
      if (newsViewModel.errorMessage!=null){
        return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(newsViewModel!.errorMessage!),
            ElevatedButton(onPressed: (){
              newsViewModel.getNewsFromApi(widget.source.id);
              setState(() {

              });
            }, child: Text("try again "))

          ],);
      }
      if (newsViewModel.newslist==null){
        return Center(child: CircularProgressIndicator(color:Colors.black ,),);
      } else {
        return ListView.builder(itemCount: newsViewModel.newslist!.length,
            itemBuilder: (context, index) {
              return Newswidget(article: newsViewModel.newslist![index]);
            });
      }

    }),

    );

  }
}
