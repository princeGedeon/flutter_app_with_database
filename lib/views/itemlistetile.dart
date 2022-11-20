import 'package:flutter/material.dart';

import '../Models/Class_models/itemlist.dart';

class ItemListTile extends StatelessWidget {
   ItemListTile({Key? key,required this.itemList,required this.onDelete,required this.onPressed}) : super(key: key);
  ItemList itemList;
  Function(ItemList) onPressed;
  Function(ItemList) onDelete;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemList.title),
      onTap: (()=>onPressed(itemList)),
      trailing: IconButton(
        onPressed:(()=>onDelete(itemList)),
        icon:Icon(Icons.delete)
      ),
    );
  }
}
