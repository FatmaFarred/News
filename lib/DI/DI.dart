import 'package:News/Apis/api%20manager.dart';
import 'package:News/Repositry/News/Data_Sources/News_Offline_DataSurces.dart';
import 'package:News/Repositry/News/Data_Sources/News_offline_DataSurces_Impl.dart';
import 'package:News/Repositry/News/Data_Sources/News_remote_DataSurces_Impl.dart';
import 'package:News/Repositry/News/News_repositry/News%20_Repositry.dart';
import 'package:News/Repositry/News/News_repositry/NewsRepositry%20impl.dart';
import 'package:News/Repositry/Sources/Repositry/SourcesRepositry.dart';
import 'package:News/Repositry/Sources/Repositry/SourcesRepositry_impl.dart';
import 'package:News/Repositry/Sources/dataSources/Source-remoteb_dataSource.dart';
import 'package:News/Repositry/Sources/dataSources/SourceRemoteDataSource%20impl.dart';
import 'package:News/Repositry/Sources/dataSources/Source_offline_datasource.dart';
import 'package:News/Repositry/Sources/dataSources/Source_offline_datasource_impl.dart';

import '../Repositry/News/Data_Sources/News_remote_DataSurces.dart';

/*
Sources_Respositry injectionSourceRepositry (){
  return Sources_Respositry_impl(sourceRemoteDataSource: injectsourceRemoteDataSources(),sourceOfflineDataSource:injectSourceOfflineDataSoure () );
}
SourceRemoteDataSource injectsourceRemoteDataSources(){
  return SourceRemoteDataSourceImpl(apiManeger: ApiManeger.getInstance());
}

NewsRepositry injectnewsRepositry (){
  return NewsRepositryImpl(newsRemoteDataSources: injetNewsRemoteDataSources(),newsOfflineDataSource: injectNewsOfflineDataSources());
}
NewsOfflineDatasurcesDataSources injectNewsOfflineDataSources (){
  return News_Offline_DataSurces_Impl();
}

NewsRemoteDataSources injetNewsRemoteDataSources() {
  return News_remote_DataSurces_Impl(apiManeger: ApiManeger.getInstance());
}
*/
/*ApiManeger injectapiManager() {
  return ApiManeger();
}*//*


Source_offline_DataSource injectSourceOfflineDataSoure (){
  return Source_offline_datasource_impl();
}*/
