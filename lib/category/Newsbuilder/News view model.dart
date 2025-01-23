import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier{
  List<Articles>?newslist;
  String ?errorMessage;

 void getNewsFromApi ( SourceId)async{
   newslist=null;
   errorMessage=null;
  try{
    var responce =await  ApiManeger.getnewsfromapiById(SourceId);
    if ( responce?.status=="error"){
      errorMessage=responce!.message!;
    } else{
      newslist=responce!.articles;
    }
  }catch (e){
    errorMessage ="error load news";
  }

  notifyListeners();
 }



}