
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/global/themes/themes.dart';
import 'package:rescue/global/widget/avatar.dart';
import 'package:rescue/pages/phone_numbers.dart';

class EditProfile extends StatefulWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: CustomTheme().lightTheme(),
    );
  }
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {

    final BaseAuth auth = AuthProvider.of(context).auth;
    String name = auth.displayName();
    return Container(
      color: Theme.of(context).backgroundColor,
      child:Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(
                    avatarUrl: auth.photoUrl(),
                    onTap: () => {
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60 , right: 60, top: 30 , bottom: 30),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        elevation: 5.0,
                        minWidth: double.infinity,
                        color: Theme.of(context).buttonColor,
                        child: new Text(' ', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        onPressed: () => {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60 , right: 60, top: 30 , bottom: 30),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        elevation: 5.0,
                        minWidth: double.infinity,
                        color: Theme.of(context).buttonColor,
                        child: new Text(' ', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        onPressed: () => {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60 , right: 60, top: 30 , bottom: 30),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        elevation: 5.0,
                        minWidth: double.infinity,
                        color: Theme.of(context).buttonColor,
                        child: new Text('Edit numbers', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PhoneNumbers()),
                          ),
                        },
                      ),
                    ),
                  ),
                ],
              )
          ),
        ]
      )
    );
  }
}
