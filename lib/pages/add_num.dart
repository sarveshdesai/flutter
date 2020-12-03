
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/pages/phone_numbers.dart';

class AddNum extends StatefulWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: Theme.of(context),
    );
  }
  @override
  _AddNumState createState() => _AddNumState();
}

class _AddNumState extends State<AddNum> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController _numbercontroller;
  TextEditingController _namecontroller;
  String userId;
  @override
  void initState(){
    super.initState();
    _namecontroller= TextEditingController(text: "");
    _numbercontroller= TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    userId = auth.uID();
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.contacts,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                          hintText: "Enter Name",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.call,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _numbercontroller,
                      decoration: InputDecoration(
                          hintText: "Enter Number",
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
            Spacer(),
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
                      addData(_namecontroller.text.toString(), _numbercontroller.text.toString()),
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => PhoneNumbers())),
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future addData(String name ,String number){
    print("$name , $number");
    return firestore.collection("users").doc(userId).collection("numbers").doc().set({
      'name' : name,
      'number' : number,
    });
  }

}
