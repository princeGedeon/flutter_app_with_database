

import 'package:flutter/material.dart';
import 'package:projet_flutter_sqlite/services/DatabaseClient.dart';

import '../../Models/Class_models/itemlist.dart';
import '../CustomAppBar.dart';
import '../adddialog.dart';

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
      appBar: CustomAppBar(titleString: "Ma liste de souhait", buttonTItle: 'Add', callbback: addItemList,),
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
  print(items);

  }

  //addItemList() async{   await  showDialog(       context: context,       builder: (context) {         return AlertDialog(           title: Text('Material Dialog'),           content: Text('Hey! I am Coflutter!'),           actions: <Widget>[             TextButton(                 onPressed: () {                  // _dismissDialog();                 },                 child: Text('Close')),             TextButton(               onPressed: () {                 print('HelloWorld!');               //  _dismissDialog();               },               child: Text('HelloWorld!'),             )           ],         );       });   }

  addItemList() async{
  await showDialog(context:context,builder:(context){
    final controller=TextEditingController();
    return  AddDialog(onAdded:(){
      handleCloseDialog();
      if (controller.text.isEmpty) return;
      DatabaseClient().addItemList(controller.text).then((value) => getItemList());

    } ,onCancel:handleCloseDialog ,controller:controller ,);
  });
  }

  handleCloseDialog(){
    Navigator.pop(context);
    FocusScope.of(context).requestFocus(FocusNode());
  }

}
