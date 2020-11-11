import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greeting = 'Good Day,';

  void getGreeting() {
    TimeOfDay now = TimeOfDay.now();

    greeting = (now.hour <= 12
        ? 'Good Morning'
        : (now.hour <= 17 ? 'Good Afternoon,' : 'Good Evening,'));

    print(now.hour);
  }

  @override
  void initState() {
    getGreeting();
    super.initState();
  }

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
            //TODO : Find hardcoded width alternative
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
      body: Padding(
        padding:
            EdgeInsets.only(left: 18.0, right: 18.0, bottom: 20.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Dwayne',
                      style: TextStyle(
                        fontSize: 29.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    Text(
                      '$greeting',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5.0),
                Expanded(
                  child: Material(
                    elevation: 16.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      height: 65.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285_1280.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'You have some important',
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500]),
            ),
            Text(
              'tasks to do for today.',
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500]),
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'PINNED',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'WorkSans',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
