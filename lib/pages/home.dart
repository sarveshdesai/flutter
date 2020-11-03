import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/pages/maincolors.dart';
import 'package:rescue/pages/root.dart';
/*
import 'package:sms_maintained/contact.dart';
import 'package:sms_maintained/generated/i18n.dart';
import 'package:sms_maintained/globals.dart';
import 'package:sms_maintained/sms.dart';
*/
class HomePage extends StatelessWidget{
  const HomePage({this.onSignedOut});
  final VoidCallback onSignedOut;

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.logOut();
      RootPage();
    } catch (e) {
      print(e);
    }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RootPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () => _signOut(context),

              child: Text('Emergency', style: Theme.of(context).textTheme.button.copyWith(fontSize: 25.0)),
              shape: CircleBorder(),
              color: Theme.of(context).buttonColor,
              padding: EdgeInsets.all(100),


            )
          ],
        ),

    );
  }
}


class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryshrine,body: Center(child: Text('Second Page',style: TextStyle(fontSize: 50.0),),),);
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryshrine,body: Center(child: Text('Third Page',style: TextStyle(fontSize: 50.0),),),);
  }
}

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryshrine,body: Center(child: Text('Fourth Page',style: TextStyle(fontSize: 50.0),),),);
  }
}
class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryshrine,body: Center(child: Text('First Page',style: TextStyle(fontSize: 50.0),),),);
  }
}