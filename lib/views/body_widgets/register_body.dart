import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  bool _showSpinner = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _submit() async {
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
        });
      } catch (e) {
        setState(() {
          _showSpinner = false;
        });
        print(e);
      }

      // if everything was a success
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => AddEmergencyContactsScreen(),
      //   ),
      // );
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
          padding: EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0),
          // padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Merriweather',
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Sign up and get started',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[500],
                  fontFamily: 'Merriweather',
                ),
              ),
              SizedBox(height: 30.0),
              Image.asset(
                'assets/images/coffee.png',
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Material(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                          ),
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          validator: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                _showSpinner = false;
                              });
                              return "Please enter email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                      child: Material(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                          ),
                          controller: _passwordController,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                _showSpinner = false;
                              });
                              return "Please enter password";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    RaisedButton(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      onPressed: _submit,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                            ),
                          ),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LoginScreenBody(),
                            //   ),
                            // );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 100.0),
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
