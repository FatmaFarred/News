import 'package:News/Apis/NewsResponse.dart';
import 'package:News/Apis/api%20manager.dart';
import 'package:News/category/Newsbuilder/News%20widget.dart';
import 'package:News/category/Newsbuilder/custom_text_field.dart';
import 'package:News/category/newsdeatilsbottom%20sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../APP Utilies/app colors.dart';

class searchTab extends StatefulWidget {
  static String routeName = "searchTab";
  Articles? article;

  searchTab({this.article});

  @override
  State<searchTab> createState() => _searchTabState();
}

class _searchTabState extends State<searchTab> {
  int selectedIndex = 0;
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.04, horizontal: width * 0.03),
        child: Column(
          children: [
            // Search TextField
            CustomTextField(
              hintText: "Search",
              onChanged: (text) {
                setState(() {
                  searchKey = text;
                });
              },
              hintTextStyle: Theme.of(context).textTheme.labelMedium,
              BoderColor: Theme.of(context).indicatorColor,
              suffixIcon: IconButton(
                onPressed: () {

                  setState(() {
                    searchKey = '';
                    Navigator.of(context).pop();
                  });
                },
                icon: Icon(Icons.close, color: Theme.of(context).indicatorColor),
              ),
            ),



            searchKey.isEmpty?
            Center(
              child: Container(color: AppColors.black,
                  child: Lottie.asset("assets/lottiee/Animation - 1739815590860.json", )),
            ): FutureBuilder<NewsResponse?>(
                future: ApiManeger.searchNews(searchKey),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.grey),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text("Something went wrong", style: Theme.of(context).textTheme.labelMedium),
                        ElevatedButton(
                          onPressed: () {
                            ApiManeger.searchNews(searchKey);
                            setState(() {});
                          },
                          child: Text("Try Again", style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ],
                    );
                  } else if (snapshot.data?.status == "error") {
                    return Column(
                      children: [
                        Text(snapshot.data?.message ?? "Error", style: Theme.of(context).textTheme.labelMedium),
                        ElevatedButton(
                          onPressed: () {
                            ApiManeger.searchNews(searchKey);
                            setState(() {});
                          },
                          child: Text("Try Again", style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ],
                    );
                  } else {
                    var newsSearchList = snapshot.data?.articles ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemCount: newsSearchList.length,
                        itemBuilder: (context, index) {
                          selectedIndex = index;
                          return InkWell(
                            onTap: () {
                              displayNewsDetailsDropdownsheet(
                                newsSearchList[index].urlToImage ?? "",
                                newsSearchList[index].content ?? "",
                                newsSearchList[index].url ?? "",
                              );
                            },
                            child: Newswidget(article: newsSearchList[index]),
                          );
                        },
                      ),
                    );
                  }
                },
              ),


          ],
        ),
      ),
    );
  }

  void displayNewsDetailsDropdownsheet(String url, String content, String urlrticle) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewsDetailsBottomSheet(content: content, urlImage: url, urlrticle: urlrticle),
    );
  }
}
        
        
        






