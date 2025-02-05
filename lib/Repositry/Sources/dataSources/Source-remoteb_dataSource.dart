
import '../../../Apis/RecourceResponce.dart';

///interface
//todo: if I ave another data source I will add another class for
abstract class SourceRemoteDataSource {
  Future<RecourceResponce?>getSources (String categoryId);


}