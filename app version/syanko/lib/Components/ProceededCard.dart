import 'package:flutter/material.dart';
import 'quantityButton.dart';

class ProceededCard extends StatelessWidget {
  ProceededCard(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.image});
  String name;
  int price;
  int quantity;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF313131),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100.0,
            width: 120.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(this.image))),
          ),
          Expanded(
            child: Container(
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Center(
                        child: Text(
                          this.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    "${this.price} -/",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 100.0,
            width: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [quantityButton(quantity: quantity)],
            ),
          )
        ],
      ),
    );
  }
}
