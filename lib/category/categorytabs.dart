import 'package:News/DI/DI.dart';
import 'package:News/DI/Di_inject.dart';
import 'package:News/category/Newsbuilder/sources_viewmodel_bloc.dart';
import 'package:News/category/source_state.dart';
import 'package:flutter/material.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/HomeScreen/category%20model.dart';
import 'package:News/category/default%20tab%20controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CategoryTabs extends StatefulWidget {
  CategoryModel Categgory;
  CategoryTabs  ({required this.Categgory});
  @override
  State<CategoryTabs> createState() => _CategoryTabsState();

}

class _CategoryTabsState extends State<CategoryTabs> {
  Sources_bloc_viewModel sources_bloc_viewModel =getIt<Sources_bloc_viewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sources_bloc_viewModel.getSourcesFromApi(widget.Categgory.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Sources_bloc_viewModel,SourceState>(bloc: sources_bloc_viewModel,
        builder: (context,state){
      if (state is SourceErrorState){
        return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state!.errorMessage!),
            ElevatedButton(onPressed: (){
              sources_bloc_viewModel.getSourcesFromApi(widget.Categgory.id);

            }, child: Text("try again "))

          ],);
      }else if (state is SourceSuccessState){
        return CategoryDefaultTabController(sourcesList: state!.sourcesList!);

      }else {
        return Center(child: CircularProgressIndicator(color:Colors.black ,),);

      }
    }
    );
    /*ChangeNotifierProvider(create: (context)=>categoryViewModel,
    child: Consumer<CategoryViewModel>(builder: (context,categoryViewModel,child){
      if (categoryViewModel.errorMessage!=null){
        return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(categoryViewModel!.errorMessage!),
            ElevatedButton(onPressed: (){
              categoryViewModel.getCategoryFromApiString(widget.Categgory.id);
              setState(() {

              });
            }, child: Text("try again "))

          ],);
      }
      if (categoryViewModel.sourcesList==null){
        return Center(child: CircularProgressIndicator(color:Colors.black ,),);
      } else {
        return CategoryDefaultTabController(sourcesList: categoryViewModel!.sourcesList!);

      }


    }),*/


    /*FutureBuilder<RecourceResponce?>(
        future: ApiManeger.getdatafromapi(widget.Categgory.id),
        builder: (context,snapshot){
         if  (snapshot.connectionState==ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(color:Colors.black ,),);
         } else if(snapshot.hasError){
           return Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text("somethin went wrong"),
             ElevatedButton(onPressed: (){
               ApiManeger.getdatafromapi(widget.Categgory.id);
               setState(() {

               });
             }, child: Text("try again "))

           ],);
         }else if (snapshot.data!.status=="error"){
           return Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text(snapshot.data!.message!),
             ElevatedButton(onPressed: (){
               ApiManeger.getdatafromapi(widget.Categgory.id);
               setState(() {

               });

             }, child: Text("try again "))

           ],);
         } else {
           var sourcesList=snapshot.data!.sources!;
                return CategoryDefaultTabController(sourcesList: sourcesList);
         }


        });
*/




  }
}
