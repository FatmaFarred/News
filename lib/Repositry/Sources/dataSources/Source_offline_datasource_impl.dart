import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Repositry/Sources/dataSources/Source_offline_datasource.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: Source_offline_DataSource)
class Source_offline_datasource_impl implements Source_offline_DataSource{
  @override
  Future<RecourceResponce?> getSources(String categoryId) async{
    // TODO: implement getSources
    //todo:read data
    var box = await Hive.openBox("sourceBox");
   var sources = await box.get(categoryId) ;
   return  sources ;

  }

  @override
  void savesources(RecourceResponce? sourceresponce,String categoryId)async {
    //todo: write data
    //todo: openbox and name yhe box
    //todo: put the data
    //todo: closw the box
   var box=await Hive.openBox("sourceBox");
   await  box.put(categoryId, sourceresponce);
  await box.close();


  }
  
  
  
}