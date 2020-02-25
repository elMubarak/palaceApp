import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/activity_feed.dart';
import 'package:fluttershare/pages/comments.dart';
import 'package:fluttershare/pages/create_account.dart';
import 'package:fluttershare/pages/edit_profile.dart';
import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/pages/post_screen.dart';
import 'package:fluttershare/pages/profile.dart';
import 'package:fluttershare/pages/search.dart';
import 'package:fluttershare/pages/timeline.dart';
import 'package:fluttershare/pages/upload.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (_) => Home());
      case 'activityFeed' :
        return MaterialPageRoute(builder: (_) => ActivityFeed());
      case 'comments' :
        return MaterialPageRoute(builder: (_) => Comments());
      case 'createAccount':
        return MaterialPageRoute(builder: (_) => CreateAccount());
      case 'editProfile':
        return MaterialPageRoute(builder: (_) => EditProfile());
      case 'postScreen' :
        return MaterialPageRoute(builder: (_) => PostScreen());
      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case 'search':
        return MaterialPageRoute(builder: (_) => Search());
      case 'timeline':
        return MaterialPageRoute(builder: (_) => Timeline());
      case 'upload':
        return MaterialPageRoute(builder: (_) => Upload());
    }
  }
}