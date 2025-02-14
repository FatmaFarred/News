
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/Repositry/News/Data_Sources/News_remote_DataSurces.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:NewsRemoteDataSources )
class News_remote_DataSurces_Impl implements NewsRemoteDataSources{
  ApiManeger apiManeger;
  News_remote_DataSurces_Impl ({required this.apiManeger});
  @override
  Future<NewsResponse?> getnewsfromapiById(String SourceId)async {
   var response = await  ApiManeger.getnewsfromapiById(SourceId);
   return response;
  }


}