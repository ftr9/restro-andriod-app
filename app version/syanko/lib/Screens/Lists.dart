import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syanko/Components/title.dart';
import 'package:syanko/Components/Foodcard.dart';
import 'package:syanko/Components/settingArgument.dart';
import 'package:syanko/Networking/backend.dart';
import 'package:syanko/State/orderCount.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  List<foodCard> foodLists = [];
  int count = 0;
  String Title = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodLists = [];
  }

  void updatefoodlist(String type, String name) async {
    Foodapi foodapi = Foodapi();
    if (type[0] == 'a') {
      dynamic result = await foodapi.fetchSpecificArea(name);
      List<foodCard> country = [];
      for (int i = 0; i <= result["meals"].length - 1; i++) {
        String name = result["meals"][i]["strMeal"];
        String image = result["meals"][i]["strMealThumb"];
        String idMeal = result["meals"][i]["idMeal"];

        country.add(foodCard(name: name, image: image, id: idMeal));
      }
      setState(() {
        foodLists = country;
        count = 1;
        Title = name;
      });
    }
    if (type[0] == 'c') {
      dynamic result = await foodapi.fetchSpecificCategory(name);
      List<foodCard> category = [];
      for (int i = 0; i <= result["meals"].length - 1; i++) {
        String name = result["meals"][i]["strMeal"];
        String image = result["meals"][i]["strMealThumb"];
        String idMeal = result["meals"][i]["idMeal"];

        category.add(foodCard(name: name, image: image, id: idMeal));
      }
      setState(() {
        foodLists = category;
        count = 1;
        Title = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Settingargument;
    if (count == 0) {
      updatefoodlist(args.Type, args.name);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
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
          orderCount(), //to track my order
        ],
      ),
      body: ListView(
        children: [
          title(
            name: "$Title",
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 100 / 130,
              children: foodLists,
            ),
          )
        ],
      ),
    );
  }
}
