import 'package:flutter/material.dart';
import 'package:News/Apis/RecourceResponce.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/HomeScreen/category%20model.dart';
import 'package:News/category/default%20tab%20controller.dart';

class CategoryTabs extends StatefulWidget {
  CategoryModel Categgory;
  CategoryTabs  ({required this.Categgory});
  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecourceResponce?>(
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





  }
}
