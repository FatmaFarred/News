import 'package:News/Repositry/Sources/dataSources/Source-remoteb_dataSource.dart';
import 'package:News/Repositry/Sources/dataSources/Source_offline_datasource.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../../Apis/RecourceResponce.dart';

import 'SourcesRepositry.dart';

@Injectable(as:Sources_Respositry )
 class Sources_Respositry_impl implements Sources_Respositry {
   SourceRemoteDataSource sourceRemoteDataSource;
   Source_offline_DataSource sourceOfflineDataSource;
   Sources_Respositry_impl ({required this.sourceRemoteDataSource,
     required this.sourceOfflineDataSource});




  Future<RecourceResponce?> getSources(String categoryId) async{
    final List<ConnectivityResult> connectivityResult =await  Connectivity().checkConnectivity();

    // the internet connection first if I got internet
    // TODO: implement getSources
    if (connectivityResult.contains(ConnectivityResult.mobile)|| connectivityResult.contains(ConnectivityResult.wifi))  {

      var sourceresponce =await  sourceRemoteDataSource.getSources(categoryId);
      sourceOfflineDataSource.savesources(sourceresponce, categoryId);
      return sourceresponce ;

      

    } else {
      var sourceresponce =await sourceOfflineDataSource.getSources(categoryId);
      return sourceresponce ;
    }
  }
 }
