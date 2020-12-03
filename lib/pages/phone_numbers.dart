import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/models/numberdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rescue/pages/add_num.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumbers extends StatefulWidget {
  @override
  _PhoneNumbers createState() => _PhoneNumbers();
}

class _PhoneNumbers extends State<PhoneNumbers> {
  List<NumberData> numberList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    String userId = auth.uID();
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60 , right: 60),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: double.infinity,
                      color: Theme.of(context).buttonColor,
                      child: new Text('Add number', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddNum()),
                        ),
                      },
                    ),
                  ),
                ),
              ),
            ])
        ));
  }
}
