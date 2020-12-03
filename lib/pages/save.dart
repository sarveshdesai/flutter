import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/models/numberdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue/pages/emergency_numbers.dart';
import 'package:url_launcher/url_launcher.dart';

class Save extends StatefulWidget {
  @override
  _SaveState createState() => _SaveState();
}

class _SaveState extends State<Save> {
  List<NumberData> numberList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 32, top: 32, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Emergency",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection("emergency").snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> querySnapshot) {
                    if (querySnapshot.hasError) {
                      return Text("has error");
                    }
                    if (querySnapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      final list = querySnapshot.data.docs;
                      bool ok;
                      String userId;
                      String lat;
                      String lon;
                      Icon trailing;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: InkResponse(
                                      containedInkWell: true,
                                      onTap: () async {
                                        userId=list[index]["userId"];
                                        lat= list[index]["lat"];
                                        lon = list[index]["lon"];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => EmergencyNum(userId, lat, lon))
                                        );
                                        },
                                      child: ListTile(
                                        leading: Icon(Icons.call),
                                        title: Text('${list[index]["name"]} needs help!', style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold)),
                                        subtitle: Text('${list[index]["date"]}  ${list[index]["time"]} '),
                                      )
                                  )
                              )
                          );
                        },
                        itemCount: list.length,
                      );
                    }
                  },
                ),
              ),
            ])
        ));
  }
}
