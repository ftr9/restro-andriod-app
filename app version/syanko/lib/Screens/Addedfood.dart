import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syanko/Components/addedCard.dart';
import 'package:syanko/Components/quantityButton.dart';
import 'package:syanko/Components/title.dart';
import 'package:syanko/State/Cart.dart';
import 'package:syanko/Components/totalAmountShowcase.dart';

class Addedfood extends StatefulWidget {
  @override
  _AddedfoodState createState() => _AddedfoodState();
}

class _AddedfoodState extends State<Addedfood> {
  List<addedCard> items = [];
  int count = 0;
  int totalQuantity = 0;
  void showAddedCard(BuildContext context) {
    Map items = Provider.of<cart>(context).order;
    List Items = items.values.toList();
    List<addedCard> temp = [];
    for (int i = 1; i <= Items.length - 1; i++) {
      String name = Items[i]["details"].name;
      String image = Items[i]["details"].image;
      int price = Items[i]["price"];
      int quantity = Items[i]["total"];
      temp.add(addedCard(
          name: name, price: price, quantity: quantity, image: image));
    }

    setState(() {
      count = 1;
      this.items = temp;
      this.totalQuantity = Items[0];
    });
  }

  void checkEmptyAddedItems() {
    int total = Provider.of<cart>(context, listen: false).order["total"];
    if (total == 0) {
      //show alert message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please add some items before you check out")));
    } else {
      Provider.of<cart>(context, listen: false).proceededCheckout();
      Navigator.pushNamed(context, "/Checkout");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.count == 0) {
      showAddedCard(context);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Cart", style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: [
          title(name: "Added items"),
          Container(
              height: MediaQuery.of(context).size.height * 0.622,
              color: Colors.grey.shade300,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: this.items,
              ) //ListView.builder(itemBuilder: (context, index) {}),
              ),
          totalamountShowcase(totalQuantity: this.totalQuantity),
          GestureDetector(
            onTap: () => checkEmptyAddedItems(),
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              color: Colors.deepOrange,
              child: Center(
                child: Text(
                  "Proceed to checkout",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
