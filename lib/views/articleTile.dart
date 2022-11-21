import 'package:flutter/material.dart';
import 'dart:io';
import '../Models/Class_models/articleitem.dart';

class ArticleTile extends StatelessWidget {
  Article article;
  ArticleTile({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
    child: Card(
      margin: EdgeInsets.all(12.0),

      elevation: 7.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(article.name,style: TextStyle(fontSize: 25),),
          if (article.image!=null) Container(
            padding: EdgeInsets.all(8),
            child: Image.file(File(article.image!)),
          ),

          Text("Prix: ${article.price}"),
          Text("Magazin,${article.shop}")
        ],
      ),
    )

      ,);
  }
}
