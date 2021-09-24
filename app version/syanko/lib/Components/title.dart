import 'package:flutter/material.dart';

class title extends StatelessWidget {
  title({required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        children: [
          Text(
            "$name",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0),
          )
        ],
      ),
    );
  }
}
