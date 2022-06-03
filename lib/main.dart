
import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  //  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: login()
      )
  )
  );
}





