
import 'package:News/Apis/NewsResponse.dart';

abstract class NewsRemoteDataSources {
  Future <NewsResponse?> getnewsfromapiById (String   SourceId);

  }