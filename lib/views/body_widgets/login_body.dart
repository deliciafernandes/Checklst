import 'package:checklst/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showSpinner = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _submit() async {
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

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      color: Colors.transparent,
      progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                'Login to save your reminders on all devices',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'WorkSans',
                  color: Colors.grey[500],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                width: 250.0,
                height: 250.0,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextFormField(
                        labelText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        errorText: 'Please input email address',
                        controller: _emailController),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: CustomTextFormField(
                          labelText: 'Password',
                          obscureText: true,
                          errorText: 'Please input password',
                          controller: _passwordController),
                    ),
                    GestureDetector(
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ForgotPassword(),
                        //   ),
                        // );
                      },
                    ),
                    SizedBox(height: 30.0),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      height: 50.0,
                      child: RaisedButton(
                        elevation: 10.0,
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        onPressed: _submit,
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
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
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
