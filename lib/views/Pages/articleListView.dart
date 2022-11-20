import 'package:flutter/material.dart';
import 'package:projet_flutter_sqlite/Models/Class_models/itemlist.dart';

import '../CustomAppBar.dart';


class ArticlListView extends StatefulWidget {
  ArticlListView({Key? key,required this.itemList}) : super(key: key);
  ItemList itemList;
  @override
  State<ArticlListView> createState() => _ArticlListViewState();
}

class _ArticlListViewState extends State<ArticlListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleString: widget.itemList.title,
        buttonTItle: "+",
        callbback: addNewItem,

      ),
      body: Center(
        child: Text("Articles"),
      ),
    );
  }

  addNewItem(){


  }
}
