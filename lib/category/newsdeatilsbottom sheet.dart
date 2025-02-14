import 'dart:core';
import 'package:url_launcher/url_launcher.dart';

import 'package:News/APP%20Utilies/Elevatedbottom.dart';
import 'package:News/APP%20Utilies/app%20colors.dart';
import 'package:News/APP%20Utilies/fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Theme provider.dart';
import '../provider/language provider.dart';

class NewsDetailsBottomSheet extends StatelessWidget {

  String urlImage;
  String content;
  String urlrticle;
  NewsDetailsBottomSheet({required this.urlImage, required this.content, required this.urlrticle });


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
    return SingleChildScrollView(
      child: Container(
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
                imageUrl: urlImage ?? "",
                placeholder: (context, url) =>
                    CircularProgressIndicator(color: AppColors.grey,),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: double.infinity,
                height: height * 0.26,
                fit: BoxFit.fill,
      
      
              ),
            ),
            Text(content ?? "", style: AppFontStyles.balck16bold),
      
            CustomeElevatedButtom(
              text: "View Full Article", style: AppFontStyles.white20bold,
              onpressed: LaunchMode

             )
      
      
          ],),
      ),
    );
  }

  /*Future<void> launchUrl(String urlrticle) async {
    final Uri url = Uri.parse(urlrticle);
    try {
      launchUrl( urlrticle);
    }catch (e){
      print ("can't launch$urlrticle");
    }

  }*/

}