import 'package:News/category/catehory%20viewmoel.dart';
import 'package:flutter/material.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/HomeScreen/category%20model.dart';
import 'package:News/category/default%20tab%20controller.dart';
import 'package:provider/provider.dart';

class CategoryTabs extends StatefulWidget {
  CategoryModel Categgory;
  CategoryTabs  ({required this.Categgory});
  @override
  State<CategoryTabs> createState() => _CategoryTabsState();

}

class _CategoryTabsState extends State<CategoryTabs> {
  CategoryViewModel categoryViewModel = CategoryViewModel ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryViewModel.getCategoryFromApiString(widget.Categgory.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>categoryViewModel,
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


    }),


    );
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
