import 'package:News/Apis/api%20manager.dart';
import 'package:News/category/Newsbuilder/News%20State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class News_ViewModel_Bloc extends Cubit<NewsState>{
  News_ViewModel_Bloc():super (NewsLoadingState());

  void getNewsFromAPI (String SourceId )async{
    try {
      emit(NewsLoadingState());
      var response = await ApiManeger.getnewsfromapiById(SourceId);
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