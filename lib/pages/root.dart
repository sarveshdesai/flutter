
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/pages/ui.dart';
import 'package:rescue/pages/signin_screen.dart';
import 'package:rescue/global/controllers/auth_provider.dart';

class RootPage extends StatefulWidget {
  final cameras;
  RootPage(this.cameras);
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final BaseAuth auth = AuthProvider.of(context).auth;
    auth.currentUser().then((String userId) {
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  void signStatus(BaseAuth auth){
    final status = auth.currentUser();
    authStatus = status == null? AuthStatus.notSignedIn: AuthStatus.notSignedIn;
  }


  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    //signStatus(auth);
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return LoginPage(
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return MainUI(
          onSignedOut: _signedOut,
          cameras : widget.cameras,
        );
    }
    return null;
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
