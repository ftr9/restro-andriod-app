import 'package:flutter/material.dart';

class quantityButton extends StatelessWidget {
  const quantityButton({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "${this.quantity}",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
