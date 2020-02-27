import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(height: _height/24,),
        Padding(
          padding: const EdgeInsets.all(27.0),
          child: Container(
            height: _height/2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(08),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) => val.contains('@') ? 'Enter a valid email' : null,
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
                      validator: (val) => val.length < 6 ? 'Please enter at least 6 characters' : null,
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
                      onTap: (){},
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
