import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:projet_flutter_sqlite/Models/Class_models/articleitem.dart';
import 'package:projet_flutter_sqlite/services/DatabaseClient.dart';
import 'package:projet_flutter_sqlite/views/CustomAppBar.dart';

import '../AddTextField.dart';

class AddArticleView extends StatefulWidget {
  AddArticleView({Key? key,required this.listId}) : super(key: key);
  int listId;
  @override
  State<AddArticleView> createState() => _AddArticleViewState();
}

class _AddArticleViewState extends State<AddArticleView> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController shopController;
  String? imagPath;

  @override
  void initState() {
    nameController=TextEditingController();
    priceController=TextEditingController();
    shopController=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    priceController.dispose();
    shopController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleString: 'Ajouter un article', buttonTItle: 'Valider', callbback: addPressed,),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Nouvel Article",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
                fontSize: 25
            ),),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 10,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (imagPath==null)?Icon(Icons.camera,size: 128,):
                        Image.file(File(imagPath!)),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: ()=>takePicture(ImageSource.camera), icon: Icon(Icons.camera_alt)),
                        IconButton(onPressed: ()=>takePicture(ImageSource.gallery), icon: Icon(Icons.photo_library_outlined))
                      ],
                    ),
                    AddTextField(hint: 'Nom', controller: nameController,),
                    AddTextField(hint: 'Prix', controller: priceController,type: TextInputType.number,),
                    AddTextField(hint: 'Magazin', controller: shopController,)


                  ],
                ) ,
              ),
            )
          ],
        ),
      ),
    );
  }

  takePicture(ImageSource source) async {
      XFile? xfile=await ImagePicker().pickImage(source: source);
      if (xfile==null) return;
      setState(() {
        imagPath=xfile!.path;
      });
  }

  addPressed(){
    print("hi");
    FocusScope.of(context).requestFocus(FocusNode());
    if (nameController.text.isEmpty) return;
    Map<String,dynamic> map={
      'task':widget.listId,
    };
    map["name"]=nameController.text;
    if (shopController.text.isEmpty) map["shop"]=shopController.text;
    double price=double.tryParse(priceController.text) ?? 0.00;
    map["price"]=price;

    if (imagPath!=null) map["image"]=imagPath!;

    print(map);
    Article article=Article.fromJson(map);
    print("h");
    DatabaseClient().upsert(article).then((value) => Navigator.of(context).pop());
    print("f");


  }
}
