import 'package:flutter/material.dart';
import 'package:syanko/Components/searchInput.dart';

class Searchscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: searchInput(
          event: 'submit',
          autofocus: true,
          callback: () {},
        ),
      ),
    );
  }
}
