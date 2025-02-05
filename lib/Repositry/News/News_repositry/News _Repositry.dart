import '../../../Apis/NewsResponse.dart';

abstract class NewsRepositry {
  Future <NewsResponse?> getnewsfromapiById (String   SourceId);


  }