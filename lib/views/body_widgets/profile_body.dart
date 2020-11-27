import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String email = 'test@gmail.com';
  String location = 'Mahalaxmi, Mumbai.';
  final FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
  }

  Position _currentPosition;

  Future<void> _getCurrentPosition() async {
    // verify permissions
    LocationPermission permission = await Geolocator.requestPermission();
    // if (permission == LocationPermission.denied ||
    //     permission == LocationPermission.deniedForever) {
    //   await Geolocator.openAppSettings();
    //   await Geolocator.openLocationSettings();
    // }
    // get current position
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // get address
    String _currentAddress = await _getGeolocationAddress(_currentPosition);
  }

  Future<String> _getGeolocationAddress(Position position) async {
    // geocoding

    _currentPosition = Position(latitude: 19.112801, longitude: 72.862480);

    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places != null && places.isNotEmpty) {
      final Placemark place = places.first;
      return "${place.thoroughfare}, ${place.locality}";
    }

    return "No address available";
  }

  @override
  void initState() {
    // _getCurrentPosition();
    _getGeolocationAddress(Position(latitude: 19.112801, longitude: 72.862480));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome User,',
            style: TextStyle(
              fontSize: 25.5,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans',
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            'Your reminders are now going to be synced on all devices.',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'WorkSans',
              color: Colors.grey[500],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            width: 200.0,
            height: 200.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'Email used:  ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'WorkSans',
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                'Current Location:  ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'WorkSans',
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          SizedBox(height: 110.0),
          RaisedButton(
            elevation: 8.0,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            onPressed: () {
              setState(() {
                signOut();
              });
            },
            child: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'If you want to sign out of Checklst App, click Sign Out.',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'WorkSans',
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           'Hello, Dwayne!',
      //           // 'Hello, ${_nameController.text}!',
      //           style: TextStyle(
      //             fontSize: 25.5,
      //             fontWeight: FontWeight.w500,
      //             fontFamily: 'WorkSans',
      //           ),
      //         ),
      //         SizedBox(height: 3.0),
      //         Text(
      //           'Hope you\'re having a good day.',
      //           style: TextStyle(
      //             fontSize: 20.0,
      //             fontFamily: 'WorkSans',
      //             color: Colors.grey[500],
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 40.0),
      //     Row(
      //       children: [
      //         Text(
      //           'Email:  ',
      //           style: TextStyle(
      //             fontSize: 20.0,
      //             fontFamily: 'WorkSans',
      //             color: Colors.black,
      //           ),
      //         ),
      //         Text(
      //           'test@gmail.com',
      //           // '${_emailController.text}',
      //           style: TextStyle(
      //             fontSize: 20.0,
      //             fontFamily: 'WorkSans',
      //             color: Colors.grey[500],
      //           ),
      //         )
      //       ],
      //     ),
      //     SizedBox(height: 20.0),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           children: [
      //             Text(
      //               'Location:  ',
      //               style: TextStyle(
      //                   fontSize: 20.0,
      //                   fontFamily: 'WorkSans',
      //                   color: Colors.black),
      //             ),
      //             Text(
      //               'Andheri east',
      //               style: TextStyle(
      //                   fontSize: 20.0,
      //                   fontFamily: 'WorkSans',
      //                   color: Colors.black),
      //             ),
      //           ],
      //         ),
      //         SizedBox(height: 10.0),
      //         // Material(
      //         //   elevation: 8.0,
      //         //   shape: RoundedRectangleBorder(
      //         //       borderRadius: BorderRadius.circular(20.0)),
      //         //   child: Container(
      //         //     width: MediaQuery.of(context).size.width,
      //         //     height: MediaQuery.of(context).size.height / 1.9,
      //         //     decoration: BoxDecoration(
      //         //       color: Colors.blueAccent,
      //         //       borderRadius:
      //         //           BorderRadius.all(Radius.circular(20.0)),
      //         //     ),
      //         //   ),
      //         // )
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
