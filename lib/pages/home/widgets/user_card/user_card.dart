import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/company_name_text.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/bullet_list_text.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/profile_photo.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/user_name_text.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  late ProfilePhoto profilePhoto;
  late UsernameText usernameText;
  late CompanyNameText companyNameText;
  late BulletListText description;

  UserCard(
      {super.key,
      required this.profilePhoto,
      required this.usernameText,
      required this.companyNameText,
      required this.description});

  UserCard.fromRawData(
      {required String photoUrl,
      required String username,
      required String companyName,
      required List<String> description,
      super.key,
      required VoidCallback onTap}) {
    profilePhoto = ProfilePhoto(photoUrl: photoUrl, onTap: onTap);
    usernameText = UsernameText(
      text: username,
    );
    companyNameText = CompanyNameText(text: companyName);
    this.description = BulletListText(texts: description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [profilePhoto, usernameText, companyNameText, description]),
    );
  }
}
