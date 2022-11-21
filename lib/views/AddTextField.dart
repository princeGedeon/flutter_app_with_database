import 'package:flutter/material.dart';

class AddTextField extends StatelessWidget {
  AddTextField({Key? key,required this.hint,required this.controller,this.type=TextInputType.text}) : super(key: key);
  String hint;
  TextEditingController controller;
  TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,

      ),
      keyboardType: type,

    );
  }
}
