
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/global/widget/avatar.dart';
import 'package:rescue/pages/edit_profile.dart';
import 'package:rescue/pages/save.dart';


class ProfileUser extends StatefulWidget {
  const ProfileUser({this.onSignedOut});
  final VoidCallback onSignedOut;

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.logOut();
    } catch (e) {
      print(e);
    }
  }
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {

  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    String name = auth.displayName();
    return Container(
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
                  Text("Hi $name, have a safe day.", style: new TextStyle(fontSize: 20.0, color: Colors.white),),
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
                        child: new Text('Edit Profile', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProfile()),
                          ),
                        },
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
                        child: new Text('Rescue Someone', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Save()),
                          ),
                        },
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
                        child: new Text('Sign Out', style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                        onPressed: () => {
                          widget._signOut(context),
                          Phoenix.rebirth(context),
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
