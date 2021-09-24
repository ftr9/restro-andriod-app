import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syanko/Components/settingArgument.dart';

class Flagbutton extends StatelessWidget {
  Flagbutton({required this.imageUrl, required this.name, required this.type});
  String imageUrl;
  String name;
  String type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/Lists',
          arguments: Settingargument(Type: "$type", name: "$name")),
      child: Container(
        height: 100.0,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.orange,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 60.0,
                width: 60.0),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "$name",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
