import 'package:checklst/models/check_if_user_logged_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

CheckIfUserLoggedIn checkIfUserLoggedIn = CheckIfUserLoggedIn();
String email = checkIfUserLoggedIn.getCurrentUserEmail();

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String location = 'Mahalaxmi, Mumbai.';
  final FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0), allowFontScaling: true);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome User,',
            style: TextStyle(
              fontSize: 25.5.ssp,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans',
            ),
          ),
          SizedBox(height: 3.0.h),
          Text(
            'Your reminders are now going to be synced on all devices.',
            style: TextStyle(
              fontSize: 16.0.ssp,
              fontFamily: 'WorkSans',
              color: Colors.grey[500],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0.h),
            width: 200.0.w,
            height: 200.0.h,
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
                  fontSize: 20.0.ssp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'WorkSans',
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 18.0.ssp,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0.h),
          Row(
            children: [
              Text(
                'Current Location:  ',
                style: TextStyle(
                  fontSize: 20.0.ssp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'WorkSans',
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 18.0.ssp,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          SizedBox(height: 110.0.h),
          RaisedButton(
            elevation: 8.0.h,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.h),
            ),
            padding: EdgeInsets.only(
                left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
            onPressed: () {
              setState(() {
                signOut();
              });
            },
            child: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 22.0.ssp,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.0.h),
          Text(
            'If you want to sign out of Checklst App,          click Sign Out.',
            style: TextStyle(
              fontSize: 16.0.ssp,
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
