import 'package:flutter/material.dart';
import 'package:syanko/Components/contryButton.dart';
import 'package:syanko/Components/title.dart';
import 'package:syanko/Components/availableButtons.dart';
import 'package:syanko/Components/searchInput.dart';
import 'package:syanko/Components/logoImage.dart';
import 'package:syanko/Screens/searchScreen.dart';
import 'package:syanko/State/orderCount.dart';

import 'package:syanko/Networking/backend.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Widget> Country = [];
  String Title = "Country";

  @override
  void fetchAllCountry() async {
    Foodapi foodapi = Foodapi();
    dynamic result = await foodapi.fetchArea();

    List<Widget> country = [];
    for (int i = 0; i <= result["meals"].length - 1; i++) {
      String name = result["meals"][i]["strArea"];
      if (name != "Unknown" && name != "British") {
        country.add(Flagbutton(
            type: 'area',
            imageUrl: 'assets/countryflag/$name.png',
            name: "$name"));
      }
    }

    setState(() {
      Country = country;
      Title = "Country";
    });
  }

  void fetchAllCategory() async {
    Foodapi foodapi = Foodapi();
    dynamic result = await foodapi.fetchCategory();

    List<Widget> country = [];
    for (int i = 0; i <= result["meals"].length - 1; i++) {
      String name = result["meals"][i]["strCategory"];
      country.add(Flagbutton(
          type: "category",
          imageUrl: 'assets/categoryflag/$name.jpg',
          name: "$name"));
    }

    setState(() {
      Country = country;
      Title = "Category";
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Logoimg(), //logo image class
        title: searchInput(
          event: 'tap',
          autofocus: false,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Searchscreen()),
            );
          },
        ), //search input class
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/Added");
            },
            child: Icon(
              Icons.add_shopping_cart_rounded,
              size: 30.0,
              color: Colors.black,
            ),
          ),
          orderCount() //count the order
        ],
      ),
      body: ListView(
        children: [
          //first part
          availableButtons(
            task1: fetchAllCountry,
            task2: fetchAllCategory,
            task3: () => Navigator.pushNamed(context, "/Checkout"),
          ), //available buttons class

          //second part
          title(name: "$Title"), // title class

          //third part showing Country flag
          Container(
              padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 4,
                children: Country,
              )),
        ],
      ),
    );
  }
}
