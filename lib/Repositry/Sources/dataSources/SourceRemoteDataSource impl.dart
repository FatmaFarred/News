
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/Repositry/Sources/dataSources/Source-remoteb_dataSource.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SourceRemoteDataSource)
//todo: we can make more than SourceRemoteDataSourceImpl as per how we get our data
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManeger apiManeger ;
  SourceRemoteDataSourceImpl ({required this.apiManeger});
  @override
  Future<RecourceResponce?> getSources(String categoryId) async{
     var response = await apiManeger.getdatafromapi(categoryId);
     return response;
  }

}