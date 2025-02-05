import 'package:News/Apis/api%20manager.dart';
import 'package:News/Repositry/News/Data_Sources/News_remote_DataSurces.dart';
import 'package:News/Repositry/News/Data_Sources/News_remote_DataSurces_Impl.dart';
import 'package:News/Repositry/News/News_repositry/News%20_Repositry.dart';
import 'package:News/Repositry/News/News_repositry/NewsRepositry%20impl.dart';
import 'package:News/category/Newsbuilder/News%20State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class News_ViewModel_Bloc extends Cubit<NewsState>{
  late NewsRepositry newsRepositry;
  News_ViewModel_Bloc({required this.newsRepositry}):super (NewsLoadingState()){

  }


  void getNewsFromAPI (String SourceId )async{
    try {
      emit(NewsLoadingState());
      var response = await newsRepositry.getnewsfromapiById(SourceId);
       if (response?.status=="error"){
         emit(NewsErrorState(errorMessage: response!.message!));
       }else {
         emit(NewsSuccessState(newsList: response!.articles!));
       }
    }catch (e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }

  }


}