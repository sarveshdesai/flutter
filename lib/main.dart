
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/pages/root.dart';
import 'package:rescue/pages/signin_screen.dart';
import 'package:rescue/pages/ui.dart';
import 'package:rescue/global/themes/themes.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return AuthProvider(
    auth: AuthHelper(),
    child: MaterialApp(
      title: 'Flutter login demo',
      theme: CustomTheme().lightTheme(),
      home: RootPage(),
    ),
  );
  }
}

