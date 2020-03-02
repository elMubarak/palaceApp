import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/activity_feed.dart';
import 'package:fluttershare/pages/create_account.dart';
import 'package:fluttershare/pages/profile.dart';
import 'package:fluttershare/pages/search.dart';
import 'package:fluttershare/pages/timeline.dart';
import 'package:fluttershare/pages/upload.dart';
import 'package:google_sign_in/google_sign_in.dart';

//vars for DB
final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');
final DateTime timeStamp = DateTime.now();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //VARs
  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  ///Functions start
  @override
  //on init
  void initState() {
    super.initState();
    //signin user
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account); //HS
    }, onError: (err) {
      print(
        'Error SignIn: $err',
      ); //on error handler
    });
    //re authenticate user silently
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account); //HS
    }).catchError((err) {
      print('Error SignIn: $err'); //catch error
    });
    //page controller on init
    pageController = PageController(initialPage: 0);
  }

  handleSignIn(GoogleSignInAccount account) {
    //HS Function
    if (account != null) {
      createUserInFirestore();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

//create user in DB
  createUserInFirestore() async {
    //add user from signIn to user var
    final GoogleSignInAccount user = googleSignIn.currentUser;
    final DocumentSnapshot doc = await usersRef.document(user.id).get();
//check if user does'nt exists
    if (!doc.exists) {
      final userName = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateAccount(),
        ),
      );
      //Get uerName for use
      //Create User with this doc
      usersRef.document(user.id).setData({
        "id": user.id,
        "userName": userName,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "timeStamp": timeStamp,
      });
    }
  }

  //dispose
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

//login function
  login() {
    googleSignIn.signIn();
  }

  //logout function
  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );

    ///Function ends
  }
//on init ends

  Scaffold buildAuthScreen() {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.photo_camera),
      //   elevation: 0.0,
      // ),
      body: PageView(
        children: <Widget>[
          RaisedButton(
            child: Text('LogOut'),
            onPressed: logout(),
          ),
          // Timeline(),
          ActivityFeed(),
          Upload(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        //TO DO: notched FAB
        currentIndex: pageIndex,
        onTap: onTap,
        backgroundColor: Colors.white,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.whatshot,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),
    );
    // return RaisedButton(
    //   onPressed: logout,
    //   child: Text('Sign OUt'),
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Palace',
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            GestureDetector(
              onTap: () => login(),
              child: Container(
                width: 250.0,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/google_signin_button.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
