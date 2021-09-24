import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syanko/State/Cart.dart';
import 'package:syanko/Components/detailsArguments.dart';

class foodCard extends StatelessWidget {
  foodCard({required this.name, required this.image, required this.id});
  String name;
  String image;
  String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('$image'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "$name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ), //text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            color: Colors.red.shade900,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<cart>(context, listen: false)
                        .addFood(this.name, this.image);
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
                    width: 140.0,
                  ),
                ),
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                )
              ],
            ),
          ), //Add button
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Details',
                  arguments: detailArguments(id: this.id));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              color: Colors.green.shade600,
              child: Row(
                children: [
                  Container(
                    child: Center(
                        child: Text(
                      "Details",
                      style: TextStyle(color: Colors.white),
                    )),
                    width: 140.0,
                  ),
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ), //Details button
        ],
      ),
    );
  }
}
