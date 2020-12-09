import 'package:checklst/models/check_if_user_logged_in.dart';
import 'package:checklst/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBody extends StatefulWidget {
  @override
  _AuthBodyState createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  String _requestedBody = 'login';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showSpinner = false;

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
          Provider.of<CheckIfUserLoggedIn>(context, listen: false)
              .changeState(true);
        });
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
          Provider.of<CheckIfUserLoggedIn>(context, listen: false)
              .changeState(true);
        });
      } catch (e) {
        setState(() {
          _showSpinner = false;
        });
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0), allowFontScaling: true);

    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      color: Colors.transparent,
      progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
        child: _requestedBody == 'login'
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back,',
                      style: TextStyle(
                        fontSize: 25.5.ssp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    SizedBox(height: 3.0.h),
                    Text(
                      'Login to save your reminders on all devices.',
                      style: TextStyle(
                        fontSize: 16.0.ssp,
                        fontFamily: 'WorkSans',
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0.h),
                      width: 200.0.w,
                      height: 200.0.h,
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
                            //TODO: responsive
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                          SizedBox(height: 30.0.h),
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 1.5.w,
                            height: 50.0.h,
                            child: RaisedButton(
                              elevation: 10.0.h,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0.h),
                              ),
                              padding: EdgeInsets.only(
                                  left: 15.w,
                                  bottom: 11.h,
                                  top: 11.h,
                                  right: 15.w),
                              onPressed: _submitSignIn,
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 20.0.ssp,
                                  color: Colors.white,
                                  fontFamily: 'WorkSans',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0.h),
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
                        fontSize: 25.5.ssp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    SizedBox(height: 3.0.h),
                    Text(
                      'Sign up and get started.',
                      style: TextStyle(
                        fontSize: 16.0.ssp,
                        fontFamily: 'WorkSans',
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
                      width: 220.0.w,
                      height: 220.0.h,
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
                                EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
                            child: CustomTextFormField(
                                labelText: 'Email',
                                textInputType: TextInputType.emailAddress,
                                obscureText: false,
                                errorText: 'Please input email address',
                                controller: _emailController),
                          ),
                          Padding(
                            //TODO : responsive
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CustomTextFormField(
                                labelText: 'Password',
                                obscureText: true,
                                errorText: 'Please input password',
                                controller: _passwordController),
                          ),
                          SizedBox(height: 30.0.h),
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 1.5.w,
                            height: 50.0.h,
                            child: RaisedButton(
                              elevation: 10.0.h,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0.h),
                              ),
                              padding: EdgeInsets.only(
                                  left: 15.w,
                                  bottom: 11.h,
                                  top: 11.h,
                                  right: 15.w),
                              onPressed: _submitSignUp,
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 20.0.ssp,
                                  color: Colors.white,
                                  fontFamily: 'WorkSans',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0.ssp),
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
                          SizedBox(height: 180.0.ssp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
