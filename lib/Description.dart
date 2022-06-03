import 'package:flutter_app/data/locationsAll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Location.dart';
import 'package:url_launcher/url_launcher.dart';
class Description extends StatelessWidget {
  Location location;
  Description(this.location);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("description"),
        backgroundColor: Colors.amber[600],
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(location.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Caveat",
                      fontWeight: FontWeight.w500,
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.network(
                  location.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                child: Text(
                  '''${location.description}''',
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                ),
                padding: EdgeInsets.all(19.0),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String url = location.locationUrl;
          _launchURL(url);
        },
        child: const Icon(Icons.map),
        backgroundColor: Colors.amber[600],
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
