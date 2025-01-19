import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:News/Apis/Api%20constants.dart';
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/end%20points.dart';
import 'package:News/Apis/Api%20constants.dart';
import 'package:News/Apis/RecourceResponce.dart';

import 'NewsResponse.dart';
import 'end points.dart';
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=86da583b6d8b4b57a5bbe7831432a60f
//https://newsapi.org/v2/top-headlines/sources?apiKey=86da583b6d8b4b57a5bbe7831432a60f
class ApiManeger {
  static Future<RecourceResponce?> getdatafromapi (String categoryid)async {
    Uri url = Uri.https(ApiConstants.baseSeverName, EndPoints.sourceApi,
        {"apiKey": ApiConstants.apikey,
          "category":categoryid

        }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var jsonbody = jsonDecode(responseBody);
      return RecourceResponce.fromJson(jsonbody);
      //  RecourceResponce.fromJson(jsonDecode(response.body)); ///shortcut for the this 3 lines to change the string to json
    } catch (e) {
      throw e;
    }
  }

  static Future <NewsResponse?> getnewsfromapiById (String   SourceId)async{
    Uri url = Uri.https(ApiConstants.baseSeverName,EndPoints.NewsApi,{
      "sources":SourceId,
      "apiKey":ApiConstants.apikey});
    try {
      var responce = await http.get(url);
      String responseBody = responce.body;
      var jsonresponse = jsonDecode(responseBody);
      return NewsResponse.fromJson(jsonresponse);
    }catch (e){
      throw e;
    }

  }

  }

