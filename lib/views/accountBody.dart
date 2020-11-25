// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:road_safety/utilities/constants.dart';
// import 'package:road_safety/views/mainPage.dart';
//
// // screens
// import 'forgot_password_screen.dart';
//
// class LoginScreenBody extends StatefulWidget {
//   @override
//   _LoginScreenBodyState createState() => _LoginScreenBodyState();
// }
//
// class _LoginScreenBodyState extends State<LoginScreenBody> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _showSpinner = false;
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> _submit() async {
//     // Perform submit action
//
//     setState(() {
//       _showSpinner = true;
//     });
//     if (_formKey.currentState.validate()) {
//       // Form validation success
//       try {
//         final user = await _auth.signInWithEmailAndPassword(
//             email: _emailController.text, password: _passwordController.text);
//         setState(() {
//           _showSpinner = false;
//         });
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MainPage(),
//           ),
//         );
//       } catch (e) {
//         setState(() {
//           _showSpinner = false;
//         });
//         print(e);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xfffafafa),
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//       ),
//       body: ModalProgressHUD(
//         inAsyncCall: _showSpinner,
//         color: Colors.transparent,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(22.0),
//             // padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(
//                   height: 40.0,
//                 ),
//                 Text(
//                   'Welcome Back,',
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: 'Merriweather',
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Login to continue',
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.grey[500],
//                     fontFamily: 'Merriweather',
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 30.0),
//                   child: Image.asset(
//                     'assets/images/laying.png',
//                     width: MediaQuery.of(context).size.width / 3,
//                     height: MediaQuery.of(context).size.width / 3,
//                   ),
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Material(
//                         elevation: 3.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             labelText: "Email",
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             enabledBorder: InputBorder.none,
//                             errorBorder: InputBorder.none,
//                             disabledBorder: InputBorder.none,
//                             contentPadding: EdgeInsets.only(
//                                 left: 15, bottom: 11, top: 11, right: 15),
//                           ),
//                           controller: _emailController,
//                           textInputAction: TextInputAction.next,
//                           keyboardType: TextInputType.emailAddress,
//                           cursorColor: Colors.black,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               setState(() {
//                                 _showSpinner = false;
//                               });
//                               return "Please enter email";
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
//                         child: Material(
//                           elevation: 3.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: TextFormField(
//                             decoration: const InputDecoration(
//                               labelText: "Password",
//                               border: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               errorBorder: InputBorder.none,
//                               disabledBorder: InputBorder.none,
//                               contentPadding: EdgeInsets.only(
//                                   left: 15, bottom: 11, top: 11, right: 15),
//                             ),
//                             controller: _passwordController,
//                             textInputAction: TextInputAction.done,
//                             obscureText: true,
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 setState(() {
//                                   _showSpinner = false;
//                                 });
//                                 return "Please enter password";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         child: Text(
//                           "Forgot Password?",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ForgotPassword(),
//                             ),
//                           );
//                         },
//                       ),
//                       SizedBox(height: 30.0),
//                       RaisedButton(
//                         elevation: 10.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         padding: EdgeInsets.only(
//                             left: 15, bottom: 11, top: 11, right: 15),
//                         color: kLightRed,
//                         onPressed: _submit,
//                         child: Text(
//                           'Log in',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             color: Colors.white,
//                             fontFamily: 'Merriweather',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 40.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "Don't have an account? ",
//                             style: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           GestureDetector(
//                             child: Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: kMainRed,
//                                 fontFamily: 'Merriweather',
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
