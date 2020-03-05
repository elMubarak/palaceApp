import 'package:flutter/material.dart';
import 'package:fluttershare/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    String error;
    final _height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(height: _height/24,),
        Padding(
          padding: const EdgeInsets.all(27.0),
          child: SingleChildScrollView(
            child: Container(
              height: _height/2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(08),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: _email,
                          validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                          onSaved: (val) => _email = val,
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            icon: Icon(Icons.email, color: Colors.black,),
                              hintStyle:TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          obscureText: true,
                          initialValue: _password,
                          validator: (val) => val.length < 6 ? 'Please enter at least 6 characters' : null,
                          onSaved: (val) => _password = val,
                          decoration: InputDecoration(
                            hintText: 'Password',
                              icon: Icon(Icons.lock, color: Colors.black,),
                              hintStyle:TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                          ),
                        ),
                        SizedBox(height: 50.0,),
                        GestureDetector(
                          onTap: () async{
                            this._formKey.currentState.save();
                            if(_formKey.currentState.validate()){
                          dynamic result = await _authService.signInWithEmailAndPassword(_email, _password);
                          Navigator.of(context).pushNamed('/home');
                          if(result == null){
                            setState((){
                              error = 'Could not sign in with those credentials';
                            });
                          }
                            }},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: Text('LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  fontWeight: FontWeight.w100),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 03.0,),
        Center(
          child: FlatButton(
            onPressed: (){},
            child: Text('Forgot Password ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
        Center(
          child: Text('Or',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ],
    );
  }
}
