

import 'package:flutter/material.dart';
import 'package:projet_flutter_sqlite/services/DatabaseClient.dart';

import '../../Models/Class_models/itemlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ItemList> items=[];

  @override
  void initState(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes tâches "),),
      body: Center(
        child: Text("Voila mon body et nous avaons ${items.length}"),
      ),
    );
  }

  getItemList() async {
    final fromDB=await DatabaseClient().allItems();
  setState(() {
    items=fromDB;
  });

  }
}
