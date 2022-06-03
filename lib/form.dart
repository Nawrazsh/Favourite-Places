import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Locations.dart';
class form extends StatefulWidget{
  @override

  _form createState() => _form();


}

class _form extends State<form>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final locationnameController = TextEditingController();
    final themeController = TextEditingController();
    final fulldescriptionController = TextEditingController();
    final imagenurlController = TextEditingController();
    final locationurlController = TextEditingController();
    final locationnameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        hintText: "location name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.drive_file_rename_outline),
      ),
      controller: locationnameController,
    );
    final themeField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        hintText: "theme",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(32.0)),
        prefixIcon: Icon(Icons.playlist_add_outlined),
      ),
      controller: themeController,
    );
    final fulldescriptionField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          hintText: "full description",
          prefixIcon: Icon(Icons.description),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(32.0))),
      controller: fulldescriptionController,
    );
    final imageurlField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          hintText: "image url",
          prefixIcon: Icon(Icons.add_a_photo_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(32.0))),
      controller: imagenurlController,
    );

    final locationurlField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          hintText: "location url",
          prefixIcon: Icon(Icons.add_location),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(32.0))),
      controller: locationurlController,
    );
    final addButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffb300),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        // ?padding: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
        onPressed: () {
          if (locationnameController.text.isEmpty | locationurlController.text.isEmpty
          | themeController.text.isEmpty | imagenurlController.text.isEmpty | fulldescriptionController.text.isEmpty) {
            Fluttertoast.showToast(
              msg: "please fill all the requirements",
              backgroundColor: Colors.grey,
            );
          } else {
            FirebaseFirestore.instance.collection('locations').add({
              'name':locationnameController.text,
              'theme':themeController.text,
              'description':fulldescriptionController.text,
              'imageUrl':imagenurlController.text,
              'locationUrl':locationurlController.text,
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Locations()),
            );
          }
        },
        child: Text("add",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("form"),
        backgroundColor: Colors.amber[600],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 155.0,
                //   child: Image.asset(
                //     "assets/add.png",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                SizedBox(height: 15.0),
                locationnameField,
                SizedBox(height: 15.0),
                themeField,
                SizedBox(height: 15.0),
                fulldescriptionField,
                SizedBox(height: 15.0),
                imageurlField,
                SizedBox(height: 15.0),
                locationurlField,
                SizedBox(
                  height: 5.0,
                ),
                addButon,
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
