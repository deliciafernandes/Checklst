import 'package:checklst/utilities/location.dart';
import 'package:checklst/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  String _requestedBody = 'loggedin';

  // String _requestedBody = 'login';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showSpinner = false;

  LocationService locationService = LocationService();
  var userLocation;
  void getLocationData() async {
//  Fetching _userLocation
    userLocation = await locationService.getLocation();
  }

  FirebaseUser loggedInUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _submitSignIn() async {
    // Perform submit action

    setState(() {
      _showSpinner = true;
    });
    if (_formKey.currentState.validate()) {
      // Form validation success
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        setState(() {
          _showSpinner = false;
        });
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MainPage(),
        //   ),
        // );
      } catch (e) {
        setState(() {
          _showSpinner = false;
        });
        print(e);
      }
    }
  }

  Future<void> _submitSignUp() async {
    // Perform submit action

    setState(() {
      _showSpinner = true;
    });

    if (_formKey.currentState.validate()) {
      // Form validation success
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        setState(() {
          _showSpinner = false;

          // if everything was a success
          _requestedBody = 'loggedin';
        });
      } catch (e) {
        setState(() {
          _showSpinner = false;
        });
        print(e);
      }
    }
  }

  void initState() {
    super.initState();

    getLocationData();
  }

  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      color: Colors.transparent,
      progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: _requestedBody == 'loggedin'
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Dwayne!',
                        // 'Hello, ${_nameController.text}!',
                        style: TextStyle(
                          fontSize: 25.5,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        'Hope you\'re having a good day.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'WorkSans',
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: [
                      Text(
                        'Email:  ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'test@gmail.com',
                        // '${_emailController.text}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'WorkSans',
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Location:  ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'WorkSans',
                                color: Colors.black),
                          ),
                          Text(
                            'Andheri east',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'WorkSans',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      // Material(
                      //   elevation: 8.0,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20.0)),
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: MediaQuery.of(context).size.height / 1.9,
                      //     decoration: BoxDecoration(
                      //       color: Colors.blueAccent,
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20.0)),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ],
              )
            : (_requestedBody == 'login'
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcome Back,',
                          style: TextStyle(
                            fontSize: 25.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          'Login to save your reminders on all devices.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'WorkSans',
                            color: Colors.grey[500],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/login.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                  labelText: 'Email',
                                  textInputType: TextInputType.emailAddress,
                                  obscureText: false,
                                  errorText: 'Please input email address',
                                  controller: _emailController),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: CustomTextFormField(
                                    labelText: 'Password',
                                    obscureText: true,
                                    errorText: 'Please input password',
                                    controller: _passwordController),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  onTap: () {
                                    //TODO: Add forget password body
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                              ButtonTheme(
                                minWidth:
                                    MediaQuery.of(context).size.width / 1.5,
                                height: 50.0,
                                child: RaisedButton(
                                  elevation: 10.0,
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  onPressed: _submitSignIn,
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _requestedBody = 'signup';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Create Your Account,',
                          style: TextStyle(
                            fontSize: 25.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          'Sign up and get started.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'WorkSans',
                            color: Colors.grey[500],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          width: 220.0,
                          height: 220.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/signup.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                labelText: 'Name',
                                textInputType: TextInputType.name,
                                obscureText: false,
                                errorText: 'Please enter your name',
                                controller: _nameController,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: CustomTextFormField(
                                    labelText: 'Email',
                                    textInputType: TextInputType.emailAddress,
                                    obscureText: false,
                                    errorText: 'Please input email address',
                                    controller: _emailController),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: CustomTextFormField(
                                    labelText: 'Password',
                                    obscureText: true,
                                    errorText: 'Please input password',
                                    controller: _passwordController),
                              ),
                              SizedBox(height: 30.0),
                              ButtonTheme(
                                minWidth:
                                    MediaQuery.of(context).size.width / 1.5,
                                height: 50.0,
                                child: RaisedButton(
                                  elevation: 10.0,
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  onPressed: _submitSignUp,
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Already have an account? ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _requestedBody = 'login';
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 180.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
