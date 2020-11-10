import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfffafafa),
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Checklst.',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontFamily: 'Playfair',
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width - 180.0,
            margin: EdgeInsets.only(right: 15.0),
            child: TextField(
              onChanged: (value) {},
              // controller: editingController,
              decoration: InputDecoration(
                hintText: "Search reminder...",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[350],
                  fontSize: 13.0,
                ),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
