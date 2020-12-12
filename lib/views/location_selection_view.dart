import 'package:checklst/utilities/constants.dart';
import 'package:checklst/widgets/map_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSelectionView extends StatefulWidget {
  @override
  _LocationSelectionViewState createState() => _LocationSelectionViewState();
}

class _LocationSelectionViewState extends State<LocationSelectionView> {
  bool _searchPressed = false;
  bool _currentLocationPressed = false;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0), allowFontScaling: true);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: kTrueWhite,
        title: Text(
          'Location',
          style: TextStyle(
              fontSize: 20.0.ssp, fontFamily: 'WorkSans', color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left,
              color: Colors.black, size: 24.0.h),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: _width,
                  margin: EdgeInsets.only(top: 5.0.h),
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
                      hintText: "Search Location or Enter location",
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[350],
                        fontSize: 13.0.ssp,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color:
                              _searchPressed ? Colors.black : Colors.grey[500],
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
                          Radius.circular(25.0.h),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0.h),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0.h),
                GestureDetector(
                  onTap: () {
                    //send back user's current location
                    setState(() {
                      _currentLocationPressed = !_currentLocationPressed;
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10.0.h),
                      Icon(Icons.near_me, color: Colors.black),
                      SizedBox(width: 25.0.h),
                      Text(
                        'Choose Current Location',
                        style: TextStyle(
                          fontSize: 20.0.ssp,
                          fontFamily: 'WorkSans',
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0.h),
                Divider(color: Colors.grey[400]),
                SizedBox(height: 250.0.h),
              ],
            ),
          ),
          Visibility(
            visible: _currentLocationPressed,
            child: Wrap(
              children: [
                Divider(color: Colors.grey[400]),
                Container(
                  width: _width,
                  height: 30.0.h,
                  margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Remind Me When I Arrive',
                      style: TextStyle(
                          fontSize: 15.0.ssp,
                          fontFamily: 'WorkSans',
                          color: Colors.blueAccent),
                    ),
                  ),
                ),
                MapContainer(width: _width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
