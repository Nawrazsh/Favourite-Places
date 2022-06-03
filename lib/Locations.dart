import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/models/Location.dart';
import 'package:flutter/material.dart';
import 'data/locationsAll.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Description.dart';
import 'form.dart';

class Locations extends StatefulWidget {
  @override

  _Location createState() => _Location();


}
class _Location extends State<Locations>{
  @override
  Widget build(BuildContext context) {

    final List<Location> listobj = locationsAll().listobj;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text('locations list'),
        actions: <Widget>[
          RaisedButton(
              child: Text('Log Out',style: TextStyle(fontSize: 18,color: Colors.white),),
              color: Colors.amber[600],
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
              }
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => form()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber[600],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('locations').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return new ListView(
            children: snapshot.data.docs.map((document) {
              String name = document['name'];
              String theme = document['theme'];
              String description=document['description'];
              String imageUrl=document['imageUrl'];
              String locationUrl=document['locationUrl'];

              return Center(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(new Location(name: name,theme:theme,description:description,imageUrl:imageUrl,locationUrl:locationUrl))),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: "Caveat",
                                fontWeight: FontWeight.w200,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(theme,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.0,
                                fontFamily: "Caveat",
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            ).toList(),
          );
        }
        )
    );


  }
}
