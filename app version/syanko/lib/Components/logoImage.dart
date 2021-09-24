import 'package:flutter/material.dart';

class Logoimg extends StatelessWidget {
  const Logoimg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 80.0,
      child: Image(
        fit: BoxFit.cover,
        height: 100.0,
        width: 100.0,
        image: AssetImage('assets/logo.png'),
      ),
    );
  }
}
