  //function to get users
    // getUsers();
    // getUserById();
    
//get users function
  // getUsers() async {
  //   final QuerySnapshot snapshot =
  //       await usersRef.getDocuments();
  //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //     // print(doc.data);
  //     // print(doc.documentID);
  //     // print(doc.exists);
  //   });
  // }
  //getUser by Id Function
  // getUserById() async {
  //   final String id = "ezzWotieda7oXiHjf274";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //   print(doc.data);
  //   print(doc.documentID);
  //   print(doc.exists);

  // }
/* for crud //
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/progress.dart';
import 'package:fluttershare/widgets/header.dart';

//firebase initializers
final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    // createUser();
    //  updateUser();
    deleteUser();
    super.initState();
  }

//create user
  createUser() async {
    await usersRef.document('nfkdwkfknk').setData({
      'userName': 'Musa',
      'postCount': 11,
      'isAdmin': true,
    });
  }

  //update user
  updateUser() async {
    final doc = await usersRef.document('-M10wcUvE4vRKemFohqI').get();
    if (doc.exists) {
      doc.reference.updateData({
        'userName': 'Distance',
        'postCount': 110,
        'isAdmin': false,
      });
    }
  }

//delete User
  deleteUser() async {
    final doc = await usersRef.document("-M10wcUvE4vRKemFohqI").get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      //stream builder gets data
      body: StreamBuilder(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //returns if !data
            return circularProgress(context);
          }
          //sets document data to final list var,
          final List<Text> childrens = snapshot.data.documents
              /*map to itterate through property of document
                 (with 'username'), set to list*/
              .map<Text>((doc) => Text(
                    doc['userName'],
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ))
              .toList();
          //returns the final list var as children of listview
          return Container(
            child: ListView(
              children: childrens,
            ),
          );
        },
      ),
    );
  }
}*/
