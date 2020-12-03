import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:rescue/locator.dart';
import 'package:rescue/global/models/user_model.dart';
import 'package:rescue/global/repository/auth_repo.dart';

class StorageRepo {
  FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://rescue-okay.appspot.com");
  AuthRepo _authRepo = locator.get<AuthRepo>();

  Future<String> uploadFile(File file) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    var storageRef = _storage.ref().child("user/profile/$userId");
    var uploadTask = storageRef.putFile(file);
    var downloadUrl = getUserProfileImage(userId);
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    return await _storage.ref().child("user/profile/$uid").getDownloadURL();
  }
}
