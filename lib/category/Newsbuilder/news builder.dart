import 'package:News/category/Newsbuilder/News%20State.dart';
import 'package:News/category/Newsbuilder/News_viewmodel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/category/Newsbuilder/News%20widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../newsdeatilsbottom sheet.dart';

class NewsBuilder extends StatefulWidget {
  Sources source ;
  NewsBuilder ({required this .source});

  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}

class _NewsBuilderState extends State<NewsBuilder> {
  News_ViewModel_Bloc news_viewModel_Bloc =News_ViewModel_Bloc ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news_viewModel_Bloc.getNewsFromAPI(widget.source.id??"");

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<News_ViewModel_Bloc,NewsState>(
      bloc:news_viewModel_Bloc ,
        builder: (context,state){
      if (state is NewsLoadingState){
        return Center(child: CircularProgressIndicator(color:Colors.black ,),);

      }else if (state is NewsErrorState){
        return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state!.errorMessage!,style: Theme.of(context).textTheme.titleMedium,),
            ElevatedButton(onPressed: (){
              news_viewModel_Bloc.getNewsFromAPI(widget.source?.id??"");

            }, child: Text("try again "))

          ],);
      }else if (state is NewsSuccessState){
        return InkWell(onTap:() {
          showModalBottomSheet(context: context, builder: (context)=>NewsDetailsBottomSheet());

        },
          child: ListView.builder(itemCount: state.newsList!.length,
              itemBuilder: (context, index) {
                return Newswidget(article: state.newsList![index]);
              }),
        );
      }else{
        return Container();
      }

    });
    /*ChangeNotifierProvider(create: (context)=>newsViewModel,
    child: Consumer<NewsViewModel>(builder: (context,newsViewModel,child){
      if (newsViewModel.errorMessage!=null){
        return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(newsViewModel!.errorMessage!,style: Theme.of(context).textTheme.titleMedium,),
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
        return InkWell(onTap:() {
         showModalBottomSheet(context: context, builder: (context)=>NewsDetailsBottomSheet());

        },
          child: ListView.builder(itemCount: newsViewModel.newslist!.length,
              itemBuilder: (context, index) {
                return Newswidget(article: newsViewModel.newslist![index]);
              }),
        );
      }

    }),

    );
*/
  }


}
