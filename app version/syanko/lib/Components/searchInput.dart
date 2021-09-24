import 'package:flutter/material.dart';

import 'package:syanko/Screens/searchScreen.dart';

class searchInput extends StatelessWidget {
  searchInput(
      {required this.event, required this.callback, required this.autofocus});
  String event;
  void callback;
  bool autofocus;

  void searchPage(BuildContext context) {
    if (event == 'tap') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Searchscreen(),
        ),
      );
    }
  }

  void submit(String value) {
    if (value.length != 0) {
      print(value);
    }

    //network call
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade300,
      ),
      child: TextField(
        autofocus: this.autofocus,
        onTap: () => searchPage(context),
        onSubmitted: submit,
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isCollapsed: true,
          hintText: "Search",
          enabled: true,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
