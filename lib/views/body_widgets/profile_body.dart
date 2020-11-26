import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Hello, Dwayne!',
          //       // 'Hello, ${_nameController.text}!',
          //       style: TextStyle(
          //         fontSize: 25.5,
          //         fontWeight: FontWeight.w500,
          //         fontFamily: 'WorkSans',
          //       ),
          //     ),
          //     SizedBox(height: 3.0),
          //     Text(
          //       'Hope you\'re having a good day.',
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         fontFamily: 'WorkSans',
          //         color: Colors.grey[500],
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 40.0),
          // Row(
          //   children: [
          //     Text(
          //       'Email:  ',
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         fontFamily: 'WorkSans',
          //         color: Colors.black,
          //       ),
          //     ),
          //     Text(
          //       'test@gmail.com',
          //       // '${_emailController.text}',
          //       style: TextStyle(
          //         fontSize: 20.0,
          //         fontFamily: 'WorkSans',
          //         color: Colors.grey[500],
          //       ),
          //     )
          //   ],
          // ),
          // SizedBox(height: 20.0),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Row(
          //       children: [
          //         Text(
          //           'Location:  ',
          //           style: TextStyle(
          //               fontSize: 20.0,
          //               fontFamily: 'WorkSans',
          //               color: Colors.black),
          //         ),
          //         Text(
          //           'Andheri east',
          //           style: TextStyle(
          //               fontSize: 20.0,
          //               fontFamily: 'WorkSans',
          //               color: Colors.black),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 10.0),
          //     // Material(
          //     //   elevation: 8.0,
          //     //   shape: RoundedRectangleBorder(
          //     //       borderRadius: BorderRadius.circular(20.0)),
          //     //   child: Container(
          //     //     width: MediaQuery.of(context).size.width,
          //     //     height: MediaQuery.of(context).size.height / 1.9,
          //     //     decoration: BoxDecoration(
          //     //       color: Colors.blueAccent,
          //     //       borderRadius:
          //     //           BorderRadius.all(Radius.circular(20.0)),
          //     //     ),
          //     //   ),
          //     // )
          //   ],
          // ),
        ],
      ),
    );
  }
}
