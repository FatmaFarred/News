import 'package:News/Apis/api%20manager.dart';
import 'package:News/Repositry/Sources/Repositry/SourcesRepositry.dart';
import 'package:News/Repositry/Sources/Repositry/SourcesRepositry_impl.dart';
import 'package:News/Repositry/Sources/dataSources/Source-remoteb_dataSource.dart';
import 'package:News/Repositry/Sources/dataSources/SourceRemoteDataSource%20impl.dart';
import 'package:News/category/source_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class Sources_bloc_viewModel extends Cubit<SourceState>{
    Sources_Respositry sources_respositry ;

  Sources_bloc_viewModel({required this.sources_respositry}):super(SourceLoadingState());


  void getSourcesFromApi (String categoryid)async{
    try {
      emit(SourceLoadingState());
      var response = await sources_respositry.getSources(categoryid);
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