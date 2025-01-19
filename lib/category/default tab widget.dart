import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:News/APP%20Utilies/Apptheme.dart';
import 'package:News/Apis/RecourceResponce.dart';

class DefaultTabWdget  extends StatelessWidget {

  Sources sources;
  bool isSelected;
  DefaultTabWdget ({required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(sources?.name??"",style: isSelected==true?Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.labelMedium);
  }
}
