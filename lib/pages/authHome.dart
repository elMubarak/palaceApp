import 'package:flutter/material.dart';
import 'package:fluttershare/pages/sign_in.dart';
import 'package:fluttershare/services/auth.dart';
import 'sign_up.dart';
import 'package:fluttershare/shared/decoration.dart';



class AuthHome extends StatefulWidget {

  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.deepOrange,
              appBar: AppBar(
                elevation: 0,
                bottom: TabBar(
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, textBaseline: TextBaseline.alphabetic),
                    labelColor: Colors.indigo,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    tabs: <Widget>[
                      Tab(text: 'Existing',),
                      Tab(text: 'New',),
                    ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  SignIn(),
                  SignUp(),
                ],
              ),
            ),
          ),

        ),
    );
  }

}
