import 'package:flutter/material.dart';
import 'package:syanko/State/Cart.dart';
import 'package:provider/provider.dart';

class orderCount extends StatelessWidget {
  const orderCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0, top: 5.0),
      child: Text(
        "${Provider.of<cart>(context).order["total"]}",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
