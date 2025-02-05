import 'package:News/provider/language%20provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/APP%20Utilies/fonts.dart';
import 'package:News/Apis/NewsResponse.dart';
import 'package:News/provider/Theme%20provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;


class Newswidget extends StatelessWidget {
  Articles article;

  Newswidget({required this.article});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<Languageprovider>(context);
    DateTime parseddate = DateTime.parse(article.publishedAt ?? "");

    DateTime now = DateTime.now();
    timeago.setLocaleMessages('ar', timeago.ArMessages()); // Add french messages



    String formattedAgoTime = timeago.format(parseddate, clock: now, allowFromNow: true,locale:languageProvider.currentLanguage=='en'?"'en":'ar' );




    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme
              .of(context)
              .indicatorColor, width: 2)

      ),
      margin: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.04),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.02),
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(16),
            child:
            CachedNetworkImage(
              imageUrl: article.urlToImage??"",
              placeholder: (context, url) => CircularProgressIndicator(color: AppColors.grey,),
              errorWidget: (context, url, error) => Icon(Icons.error),
             width: double.infinity,
      height: height * 0.26,
      fit: BoxFit.fill,


    ),
          ),
          Text(article.title ?? "", style: Theme
              .of(context)
              .textTheme
              .labelLarge,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("By : ${article.author?.substring(0, 8) ?? ""}",
                  style: AppFontStyles.grey12medium),


              Text(formattedAgoTime ?? "", style: AppFontStyles.grey12medium,)
            ],)

        ],),
    );
  }
}
