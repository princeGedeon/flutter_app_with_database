import 'package:flutter/material.dart';
import 'package:projet_flutter_sqlite/Models/Class_models/itemlist.dart';
import 'package:projet_flutter_sqlite/services/DatabaseClient.dart';
import 'package:projet_flutter_sqlite/views/Pages/addArticleView.dart';

import '../../Models/Class_models/articleitem.dart';
import '../CustomAppBar.dart';
import '../articleTile.dart';


class ArticlListView extends StatefulWidget {
  ArticlListView({Key? key,required this.itemList}) : super(key: key);
  ItemList itemList;
  @override
  State<ArticlListView> createState() => _ArticlListViewState();
}

class _ArticlListViewState extends State<ArticlListView> {
  List<Article> articles=[];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getArticle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleString: widget.itemList.title,
        buttonTItle: "+",
        callbback: addNewItem,

      ),
      body: ListView.builder( itemBuilder: ((context,index)=>ArticleTile(article: articles[index],)),itemCount: articles.length,)
    );
  }

  addNewItem(){
    
    final next=AddArticleView(listId: widget.itemList.id);
    final route=MaterialPageRoute(builder: ((context)=>next));
    Navigator.of(context).push(route).then((value) => getArticle());


  }

  getArticle() async{
      DatabaseClient().ariclesFromId(widget.itemList.id).then((value){
        print(value);
          setState(() {
            this.articles=value;
          });


      });
  }
}
