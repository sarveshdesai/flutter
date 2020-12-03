import 'package:firebase_auth/firebase_auth.dart';
import 'package:rescue/global/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final fireuser = FirebaseAuth.instance.currentUser;

  AuthRepo();

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential =
        GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    var authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserModel(authResult.user.uid,
        displayName: authResult.user.displayName);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser;
    return UserModel(firebaseUser?.uid,
        displayName: firebaseUser?.displayName);
  }

  Future<void> updateDisplayName(String displayname) async {
    var user =  _auth.currentUser;

    user.updateProfile(displayName: displayname);


  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = await _auth.currentUser;

    var authCredentials = EmailAuthProvider.getCredential(
        email: firebaseUser.email, password: password);
    try {
      var authResult = await firebaseUser
          .reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = await _auth.currentUser;
    firebaseUser.updatePassword(password);
  }
}
