import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/models/numberdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue/pages/add_num.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyNum extends StatefulWidget {
  final uid, lat , lon;
  EmergencyNum(this.uid, this.lat , this.lon);
  @override
  _EmergencyNum createState() => _EmergencyNum();
}

class _EmergencyNum extends State<EmergencyNum> {
  List<NumberData> numberList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void launchURL(String lat ,String lon) async {

    String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$lon";



    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String userId = widget.uid;
    String lat = widget.lat;
    String lon = widget.lon;
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 32, top: 32, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Emergency Contacts",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: InkResponse(
                                      containedInkWell: true,
                                      onTap: () async {
                                        launchURL(lat, lon);
                                      },
                                      child: ListTile(
                                        leading: Icon(Icons.call),
                                        title: Text('Open Maps Location ', style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold)),
                                        subtitle: Text('$lat , $lon'),
                                      )
                                  )
                              )
                          )
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection("users").doc(userId).collection("numbers").snapshots(),
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
                      Icon trailing;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          /*ok = list[index]["status"];
                          if (ok == true) {
                            trailing = Icon(Icons.check_circle);
                          } else {
                            trailing = Icon(Icons.account_circle_rounded);
                          }*/
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
                                            String callhelper = list[index]["number"].toString();
                                            String call = 'tel: $callhelper';
                                            if(await canLaunch(call)){
                                                await launch(call);
                                            }else{
                                              throw 'could not launch $call';
                                            }
                                          },
                                      child: ListTile(
                                        leading: Icon(Icons.call),
                                        title: Text(list[index]["name"].toString(), style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold)),
                                        subtitle:
                                            Text(list[index]["number"].toString()),
                                        trailing: trailing,
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
