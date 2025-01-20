import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Sources>?sourcesList;

  String? errorMessage;

  void getCategoryFromApiString(categoryid) async {
    sourcesList=null;
    errorMessage=null;
    try {
      var responce = await ApiManeger.getdatafromapi(categoryid);
      if (responce?.status == "error") {
        errorMessage = responce!.message!;
      } else {
        sourcesList = responce!.sources!;
      }
    }
    catch (e) {
      errorMessage = "error to load sources ";
    }
    notifyListeners();
  }
}