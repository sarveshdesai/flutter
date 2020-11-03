import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/pages/maincolors.dart';

class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryshrine, body: makeBody,);
  }
}



final makeBody = Container(
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return makeCard;
    },
  ),
);
final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: secshrine),
    child: makeListTile,
  ),
);
final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.call, color: accentmar, ),
    ),
    title: Text(
      "7045020790",
      style: TextStyle(color: accentmar, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.fireplace, color: accentmar),
        Text(" Fire Guy", style: TextStyle(color: accentmar))
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: accentmar, size: 30.0)
);
