
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/Repositry/News/Data_Sources/News_remote_DataSurces.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'News_Offline_DataSurces.dart';

@Injectable(as:NewsOfflineDatasurcesDataSources )
class News_Offline_DataSurces_Impl implements NewsOfflineDatasurcesDataSources{
  @override
  Future<NewsResponse?> getnewsfromapi(String SourceId) async{
    var box = await Hive.openBox("NewsBox");
    var newsResponse = await box.get(SourceId);
    return newsResponse;

  }

  @override
  void saveNews(NewsResponse? newsResponse,String SourceId)async {
    var box = await Hive.openBox("NewsBox");
    await box.put(SourceId, newsResponse);
    await box.close();
  }



}