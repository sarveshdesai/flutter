import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseAuth {
  Future<String> signInWithEmail(String email, String password);
  Future<String> signUpWithEmail(String email, String password);
  Future<String> signInWithGoogle();
  Future<String> currentUser();
  Future<bool> checkUser();
  Future<void> logOut();
  String photoUrl();
  String displayName();
  String uID();
}


class AuthHelper implements BaseAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithEmail(String email, String password) async{
   final res = await _auth.signInWithEmailAndPassword(email: email, password: password);
   final User user = res.user;
   return user.uid;
  }

  Future<String> signUpWithEmail(String email, String password) async{
    final res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    print("Created user");
    return res.user.uid;
  }

  Future<String> signInWithGoogle() async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    final acc = await googleSignIn.signIn();
    final auth = await acc.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    final res = await _auth.signInWithCredential(credential);

    return res.user.uid;
  }

  Future<String> currentUser() async{
    return _auth.currentUser?.uid;
  }

  Future<void> logOut(){
    GoogleSignIn().signOut();
    return _auth.signOut();
  }

  String photoUrl() {
    String url = _auth.currentUser.photoURL.toString();
    return url;
  }

  String displayName(){
    String name = _auth.currentUser.displayName.toString();
    return name;
  }

  String uID(){
    String uid = _auth.currentUser.uid;
    return uid;
  }

  Future<bool> checkUser() async{
    String ok = _auth.currentUser.uid;
    if(ok != null){
      return true;
    }else{
      return false;
    }
  }

}
