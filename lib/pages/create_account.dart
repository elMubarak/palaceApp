import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  submit() {
    _formKey.currentState.save();
    Navigator.pop(context,userName);
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      appBar: header(context, titleText: 'Set up UserName'),
      body: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Container(
            child: Center(
              child: Text('Set UserName'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: TextFormField(
                onSaved: (val) => userName = val,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "UserName",
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  hintText: "Text must be at least 3 characters",
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: 
            submit(),
          
          child: Container(
            width:50.0,
            height:20.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
