import 'dart:io';

import 'package:rescue/locator.dart';
import 'package:rescue/global//models/user_model.dart';
import 'package:rescue/global/controllers/user_controller.dart';
import 'package:rescue/global/widget/avatar.dart';
import 'package:rescue/global/widget/manage_profile_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  //static String route = "profile-view";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserModel _currentUser = locator.get<UserController>().currentUser as UserModel ;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(
                    avatarUrl: _currentUser?.avatarUrl,
                    onTap: () async {
                      File image = (await _picker.getImage(
                          source: ImageSource.gallery)) as File;

                      await locator
                          .get<UserController>()
                          .uploadProfilePicture(image);

                      setState(() {});
                    },
                  ),
                  Text(
                      "Hi ${_currentUser.displayName ?? 'nice to see you here.'}"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ManageProfileInformationWidget(
              //currentUser: _currentUser,
            ),
          )
        ],
      ),
    );
  }
}
