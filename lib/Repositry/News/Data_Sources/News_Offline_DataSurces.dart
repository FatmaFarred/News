
import 'package:News/Apis/NewsResponse.dart';

abstract class NewsOfflineDatasurcesDataSources {
  Future <NewsResponse?> getnewsfromapi (String   SourceId );
  void saveNews (NewsResponse? newsResponse,String SourceId);

  }