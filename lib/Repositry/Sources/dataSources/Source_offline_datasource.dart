
import '../../../Apis/RecourceResponce.dart';

abstract class Source_offline_DataSource {

  Future<RecourceResponce?> getSources (String categoryId);
  void savesources (RecourceResponce? sourceresponce,String categoryId);


}