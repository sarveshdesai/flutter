
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/pages/root.dart';
import 'package:rescue/global/themes/themes.dart';

List<CameraDescription> cameras;

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return AuthProvider(
    auth: AuthHelper(),
    child: MaterialApp(
      title: 'Flutter login demo',
      theme: CustomTheme().lightTheme(),
      home: RootPage(cameras),
    ),
  );
  }
}

