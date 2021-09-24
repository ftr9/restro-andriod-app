import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syanko/State/Cart.dart';
import 'package:syanko/Components/ProceededCard.dart';
import 'package:syanko/Components/totalAmountShowcase.dart';

class finalCheckout extends StatefulWidget {
  @override
  _finalCheckoutState createState() => _finalCheckoutState();
}

class _finalCheckoutState extends State<finalCheckout> {
  ListView showProceededItems() {
    List items = Provider.of<cart>(context, listen: false).Proceeded["items"];

    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ProceededCard(
              name: items[index]["details"].name,
              price: items[index]["price"],
              quantity: items[index]["total"],
              image: items[index]["details"].image);
        },
        itemCount: items.length);
  }

  void finalPay(BuildContext context) {
    Provider.of<cart>(context, listen: false).finalPayment(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        centerTitle: true,
        title: Text(
          "Final checkout",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.60,
            color: Colors.white,
            child: Provider.of<cart>(context).Proceeded["items"].length == 0
                ? Text("Please order something")
                : showProceededItems(),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 28.0),
            child: totalamountShowcase(
                totalQuantity:
                    Provider.of<cart>(context).Proceeded["totalQuantity"]),
          ),
          Container(
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      this.finalPay(context);
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "cash pay",
                        style: TextStyle(fontSize: 15.0),
                      )),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      this.finalPay(context);
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                        "digital pay",
                        style: TextStyle(fontSize: 15.0),
                      )),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
