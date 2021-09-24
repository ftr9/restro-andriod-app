import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.name, this.onclick, required this.unique});
  String name;
  dynamic onclick;
  bool unique;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: this.unique ? Colors.red.shade800 : Colors.grey.shade400,
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Text(
          name,
          style: TextStyle(color: this.unique ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
