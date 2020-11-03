import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/Datatypes/numberdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Numbers extends StatefulWidget {
  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
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
                    /*Text(
                      "Emergency Contacts",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),*/
                    Expanded(
                      child: TextField(
                        //controller: _emailcontroller,
                        decoration: InputDecoration(
                            hintText: "Search",
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                  color: Theme.of(context).accentColor,
                                )
                            )

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection("contact").snapshots(),
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
                          ok = list[index]["status"];
                          if (ok == true) {
                            trailing = Icon(Icons.check_circle);
                          } else {
                            trailing = Icon(Icons.account_circle_rounded);
                          }
                          return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: InkResponse(
                                      containedInkWell: true,
                                      onTap: () => {
                                            print("okay"),
                                          },
                                      child: ListTile(
                                        leading: Icon(Icons.call),
                                        title: Text(list[index]["name"].toString(), style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold)),
                                        subtitle:
                                            Text(list[index]["number"].toString()),
                                        trailing: trailing,
                                      ))));
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
