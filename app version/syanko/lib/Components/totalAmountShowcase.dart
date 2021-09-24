import 'package:flutter/material.dart';
import 'package:syanko/Components/quantityButton.dart';

class totalamountShowcase extends StatelessWidget {
  const totalamountShowcase({
    Key? key,
    required this.totalQuantity,
  }) : super(key: key);

  final int totalQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Text(
              "Total",
              style: TextStyle(fontSize: 18.0),
            ),
            margin: EdgeInsets.only(right: 40.0, top: 5.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: quantityButton(quantity: this.totalQuantity * 120),
            width: MediaQuery.of(context).size.width * 0.3,
          )
        ],
      ),
    );
  }
}
