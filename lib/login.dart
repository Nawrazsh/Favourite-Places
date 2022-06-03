// import 'package:a1/AuthService.dart';
// import 'package:a1/Locations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Locations.dart';
import 'package:flutter_app/registeration.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'Locations.dart';
class login extends StatefulWidget{
  @override
  _login createState() => _login();
}
class _login extends State<login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
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
    final passwordField = TextFormField(
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
      controller: passwordController,
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffffb300),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()async {
          if (nameController.text.isEmpty || passwordController.text.isEmpty) {
                Fluttertoast.showToast(
                msg: "please enter the name and the password",
                backgroundColor: Colors.grey,
                );
          }
          else {
            WidgetsFlutterBinding.ensureInitialized();
            await Firebase.initializeApp();
            var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: nameController.text, password: passwordController.text);
            if(result != null){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Locations()),
              );
            }
            else{
              Fluttertoast.showToast(
                msg: "user not found",
                backgroundColor: Colors.grey,
              );
          }
          }
        },
        child: Text("Login",
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
          Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => regestration()),
              );


        },
        child: Text("regestration",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("log in"),
        backgroundColor: Colors.amber[600],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 45.0),
                nameField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
                rsgesterButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

