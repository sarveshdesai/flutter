import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';


class HomePage extends StatefulWidget{


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userId;
  String name;

  @override
  Widget build(BuildContext context) {

    final BaseAuth auth = AuthProvider.of(context).auth;
    userId = auth.uID();
    name = auth.displayName();

    void _getCurrentLocation() async {

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("Location Broadcasted", style: new TextStyle(color: Theme.of(context).accentColor),),
        content: Text('Your location is ${position.latitude} , ${position.longitude}', style: new TextStyle(color: Theme.of(context).accentColor)),
        actions: [
          FlatButton(child: Text("Okay")),
        ],
        backgroundColor: Theme.of(context).backgroundColor,
      ),
        barrierDismissible: true,
      );

    }

    Future addData(String name, String uid ) async {
      DateTime now = new DateTime.now();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      String date = '${now.day}/${now.month}/${now.year}';
      String time = '${now.hour}:${now.minute}';
      String lat = position.latitude.toString();
      String lon = position.longitude.toString();
      print("$name $lat $lon $uid $date $time");
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("Location Broadcasted", style: new TextStyle(color: Theme.of(context).accentColor),),
        content: Text('Your location is ${position.latitude} , ${position.longitude}', style: new TextStyle(color: Theme.of(context).accentColor)),
        actions: [
          FlatButton(child: Text("Okay")),
        ],
        backgroundColor: Theme.of(context).backgroundColor,
      ),
        barrierDismissible: true,
      );
      return firestore.collection("emergency").doc().set({
        'lat' : lat,
        'lon' : lon,
        'name' : name,
        'userId' : uid,
        'date' : date,
        'time' : time,
      });
    }

    

    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(

              child: Text('Emergency', style: Theme.of(context).textTheme.button.copyWith(fontSize: 25.0)),
              shape: CircleBorder(),
              color: Theme.of(context).buttonColor,
              padding: EdgeInsets.all(100),
              onPressed: ()=> {
                addData(name, userId),
              },


            )
          ],
        ),

    );
  }
}
