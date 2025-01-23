import 'package:News/Apis/api%20manager.dart';
import 'package:News/category/source_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Sources_bloc_viewModel extends Cubit<SourceState>{
  Sources_bloc_viewModel():super(SourceLoadingState());

  void getSourcesFromApi (String categoryid)async{
    try {
      emit(SourceLoadingState());
      var response = await ApiManeger.getdatafromapi(categoryid);
      if (response?.status=="error"){
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }else {
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return ;
      }
      
    }catch (e){
      emit(SourceErrorState(errorMessage: e.toString()));

    }

  }



}