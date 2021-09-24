import 'package:flutter/material.dart';

import 'package:syanko/Components/Button.dart';

class availableButtons extends StatelessWidget {
  availableButtons(
      {required this.task1, required this.task2, required this.task3});
  dynamic task1;
  dynamic task2;
  dynamic task3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Row(
        children: [
          Button(
            unique: false,
            name: "Country",
            onclick: task1,
          ),
          SizedBox(
            width: 15.0,
          ),
          Button(
            unique: false,
            name: "Category",
            onclick: task2,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.17),
          Button(
            unique: true,
            name: "My Order",
            onclick: task3,
          )
        ],
      ),
    );
  }
}
