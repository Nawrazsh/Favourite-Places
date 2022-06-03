// import 'package:a1/AuthService.dart';
// import 'package:a1/Locations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Locations.dart';
import 'package:flutter_app/login.dart';
// import 'Locations.dart';
import 'package:fluttertoast/fluttertoast.dart';
class regestration extends StatefulWidget{
  @override
  _regestration createState() => _regestration();
}
class _regestration extends State<regestration> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController1 = TextEditingController();
    final passwordController2 = TextEditingController();
    final nameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          prefixIcon: Icon(Icons.perm_identity_sharp),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(32.0))),
      controller: nameController,
    );
    final passwordField1 = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(32.0))),
      controller: passwordController1,
    );
    final passwordField2 = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          hintText: "Confirm Password",
          prefixIcon: Icon(Icons.lock),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.circular(32.0))),
      controller: passwordController2,
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffb300),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: ()async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login()),
          );


        },
        child: Text("log in",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final rsgesterButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffb300),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()async {
          if (nameController.text.isEmpty || passwordController1.text.isEmpty) {

            Fluttertoast.showToast(
              msg: "please enter the name and the password",
              backgroundColor: Colors.grey,
            );

          }
          else
            if ( passwordController2.text.isEmpty) {
              Fluttertoast.showToast(
                msg: "please confirm the password",
                backgroundColor: Colors.grey,
              );
          }
            else
            if ( passwordController2.text!=passwordController1.text) {
              Fluttertoast.showToast(
                msg: "password are not matching",
                backgroundColor: Colors.grey,
              );
            }
          else {
            WidgetsFlutterBinding.ensureInitialized();
            await Firebase.initializeApp();
            var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: nameController.text, password: passwordController1.text);
            if(result != null){

              // pushReplacement
              Fluttertoast.showToast(
                msg: "regestration have done successfully",
                backgroundColor: Colors.grey,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            }
            else{
              Fluttertoast.showToast(
                msg: "try again",
                backgroundColor: Colors.grey,
              );
            }
          }
        },
        child: Text("regester",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("regestration"),
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

                SizedBox(height: 45.0),
                nameField,
                SizedBox(height: 25.0),
                passwordField1,
                SizedBox(height: 25.0),
                passwordField2,
                SizedBox(
                  height: 25.0,
                ),
                rsgesterButton,
                SizedBox(
                  height: 10.0,
                ),
                loginButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}

