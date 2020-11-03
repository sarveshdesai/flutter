
import 'package:flutter/cupertino.dart';

InkResponse(
onTap: () async {
if(_emailcontroller.text.isEmpty || _passwordcontroller.text.isEmpty){
print("Email or Password cannot be empty");
return;
}
try{
final user =await AuthHelper.signInWithEmail(email: _emailcontroller.text , password: _passwordcontroller.text);
if(user != null){
print("login successfull");
}
}catch(e){
print(e);
}
},
child: Container(
padding: EdgeInsets.all(16),
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(
color: Theme.of(context).iconTheme.color,
width: 2.1,
),
),
child: Icon(
Icons.arrow_forward,
),
)
),



//ImageInfo

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rescue/pages/signin_screen.dart';
import 'package:rescue/pages/ui.dart';
import 'package:rescue/global/themes/themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: CustomTheme().lightTheme(),
      home: Main()));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData && snapshot.data != null){
            return UI();
          }else{
            return LoginPage();
          }
        }
    );
  }
}