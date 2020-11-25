import 'package:checklst/widgets/FABBottomAppBar.dart';
import 'package:flutter/material.dart';
import 'accountBody.dart';
import 'remindersBody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _searchPressed = false;

  int _index = 1;
  List<Widget> _widgetList = [
    RemindersBody(),
    RemindersBody(),
    // AccountBody(),
  ];

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
            margin: EdgeInsets.only(right: 15.0, top: 5.0),
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
      body: _widgetList[_index],
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Add Reminder',
        color: Colors.grey,
        backgroundColor: Colors.white,
        selectedColor: Colors.black,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'Reminders'),
          FABBottomAppBarItem(iconData: Icons.face, text: 'Account'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: add reminder functionality
          print('pressed');
        },
        highlightElevation: 3.0,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
