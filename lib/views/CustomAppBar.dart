

import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  //const CustomAppBar({Key? key}) : super(key: key);
  String titleString;
  String buttonTItle;
  VoidCallback callbback;


  CustomAppBar({required this.titleString, required this.buttonTItle,required this.callbback}):super(
    title:Text(titleString),
    actions: [
      TextButton(onPressed: callbback, child: Text(
        buttonTItle,
        style: TextStyle(color: Colors.white),
      ))
    ]
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
