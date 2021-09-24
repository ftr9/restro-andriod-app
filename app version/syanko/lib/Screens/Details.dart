import 'package:flutter/material.dart';
import 'package:syanko/Components/title.dart';
import 'package:syanko/Components/detailsArguments.dart';
import 'package:syanko/Networking/backend.dart';

const style1 = TextStyle(color: Colors.black, fontSize: 20.0);
const style2 = TextStyle(color: Colors.black, fontSize: 16.0);

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map details = {};
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    details = {};
    setState(() {
      details = {};
    });
  }

  void getDetails(String id) async {
    Foodapi foodapi = Foodapi();
    dynamic details = await foodapi.fetchById(id);
    setState(() {
      this.details = details;
      count = 1;
    });
  }

  dynamic checkValidImage() {
    if (this.details["image"] != null)
      return NetworkImage(this.details["image"]);
    else
      return AssetImage("assets/logo.png");
  }

  @override
  Widget build(BuildContext context) {
    dynamic args =
        ModalRoute.of(context)!.settings.arguments as detailArguments;
    if (count == 0) {
      this.getDetails(args.id);
    }
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(
          "${details["name"] != null ? details["name"] : ""}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: checkValidImage(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Category", style: style1),
                    SizedBox(height: 10.0),
                    Text(
                        "${details["category"] != null ? details["category"] : ""}",
                        style: style2)
                  ],
                ),
                Column(
                  children: [
                    Text("Area", style: style1),
                    SizedBox(height: 10.0),
                    Text("${details["area"] != null ? details["area"] : ""}",
                        style: style2)
                  ],
                ),
                Column(
                  children: [
                    Text("Tags", style: style1),
                    SizedBox(height: 10.0),
                    Text("${details["tags"] != null ? details["tags"] : ""}",
                        style: style2)
                  ],
                ),
              ],
            ),
          ),
          title(name: "Ingredients"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: MediaQuery.of(context).size.height * 0.32,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                        ". ${details["ingredients"] != null ? details["ingredients"][index] : ""}",
                        style: style2),
                    padding: EdgeInsets.all(5.0),
                  );
                },
                itemCount: details["ingredients"] != null
                    ? details["ingredients"].length
                    : 0),
          )
        ],
      ),
    );
  }
}
