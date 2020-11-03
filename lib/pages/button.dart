import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Buttonns extends StatefulWidget {

  @override
  _ButtonnsState createState() => _ButtonnsState();
}

class _ButtonnsState extends State<Buttonns> {
  @override
  Widget build(BuildContext context) {
    Key ok = ValueKey("1");
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          children: <Widget>[
            Padding(
              key: ValueKey("1"),
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
                        title: Text("ok"),
                        subtitle:  Text("ok"),
                        trailing: Icon(Icons.call),
                      )
                  )
              )
            ),
            Padding(
                key: ValueKey("2"),
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
                          title: Text("notok"),
                          subtitle:  Text("notok"),
                          trailing: Icon(Icons.call),
                        )))
            ),

          ],
          onReorder: (oldindex, newindex){
            setState(() {
              if(newindex>oldindex){
                newindex-=1;
              }
            });
          },
        ),
      )

    );
  }
}