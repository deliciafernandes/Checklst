import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _searchPressed = false;
  String greeting = 'Good Day';

  int _index = 1;
  List<Widget> _widgetList = [
    // WhatToDoBody(),
  ];

  void getGreeting() {
    TimeOfDay now = TimeOfDay.now();

    greeting = (now.hour <= 12
        ? 'Good Morning'
        : (now.hour <= 17 ? 'Good Afternoon' : 'Good Evening'));
  }

  @override
  void initState() {
    getGreeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    // var _height = MediaQuery.of(context).size.height;

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
            width: _width - 180.0,
            //TODO : Find hardcoded width alternative
            margin: EdgeInsets.only(right: 15.0),
            child: TextField(
              onTap: () {
                setState(() {
                  _searchPressed = true;
                });
              },
              onChanged: (value) {},
              // controller: editingController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Search reminder...",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[350],
                  fontSize: 13.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: _searchPressed ? Colors.black : Colors.grey[500],
                  ),
                  onPressed: () {
                    setState(() {
                      _searchPressed = true;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[500]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
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
      body: Padding(
        padding:
            EdgeInsets.only(left: 18.0, right: 18.0, bottom: 20.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello Dwayne, $greeting!',
              style: TextStyle(
                fontSize: 25.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'WorkSans',
              ),
            ),
            SizedBox(height: 3.0),
            Text(
              'You have some important tasks to do for today.',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'WorkSans',
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              children: [
                Text(
                  'TODAY\'S PRIORITIES',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 30.0),
                Text(
                  'UPCOMING',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[350],
                  ),
                ),
              ],
            ),
            // _widgetList[_index],
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _index,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Colors.black,
      //   iconSize: 20.0,
      //   onTap: (int index) {
      //     setState(() {
      //       _index = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Image.asset(
      //           "assets/images/ChecklstLogo.png",
      //           width: 20.0,
      //         ),
      //         label: 'Reminders'),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.add,
      //       ),
      //       label: "Add Reminder",
      //     ),
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(Icons.account_circle), label: "Account"),
      //     BottomNavigationBarItem(icon: Icon(Icons.face), label: "Account"),
      //   ],
      // ),
    );
  }
}

// Extra widget
// Expanded(
// child: Material(
// elevation: 16.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25.0),
// ),
// child: Container(
// height: 65.0,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(25.0)),
// image: DecorationImage(
// image: NetworkImage(
// 'https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285_1280.jpg'),
// fit: BoxFit.cover,
// ),
// ),
// ),
// ),
// ),

// Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// RotatedBox(
// quarterTurns: 3,
// child: Text(
// 'PINNED',
// style: TextStyle(
// fontSize: 25.0,
// fontFamily: 'WorkSans',
// color: Colors.black,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// SizedBox(width: 8.0),
// Container(
// width: 200,
// height: 200,
// color: Colors.black,
// )
// ],
// ),
