
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Repositry/News/Data_Sources/News_Offline_DataSurces.dart';
import 'package:News/Repositry/News/Data_Sources/News_remote_DataSurces.dart';
import 'package:News/Repositry/News/News_repositry/News%20_Repositry.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:NewsRepositry )
class NewsRepositryImpl implements NewsRepositry{
  NewsRemoteDataSources newsRemoteDataSources;
  NewsOfflineDatasurcesDataSources newsOfflineDataSource;
  NewsRepositryImpl ({required this.newsRemoteDataSources,
  required this.newsOfflineDataSource
  });
  @override
  Future<NewsResponse?> getnewsfromapiById(String SourceId) async{
   final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
   if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
     var newsResponce= await newsRemoteDataSources.getnewsfromapiById(SourceId , );
     newsOfflineDataSource.saveNews(newsResponce,SourceId);
     return newsResponce;

   }else {
     var newsResponce=newsOfflineDataSource.getnewsfromapi(SourceId);
     return newsResponce;
   }

  }

}