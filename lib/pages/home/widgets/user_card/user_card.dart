import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/company_name_text.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/bullet_list_text.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/profile_photo.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/user_name_text.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final ProfilePhoto profilePhoto;
  final UsernameText usernameText;
  final CompanyNameText companyNameText;
  final BulletListText description;

  const UserCard(
      {super.key,
      required this.profilePhoto,
      required this.usernameText,
      required this.companyNameText,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        profilePhoto,
        usernameText,
        companyNameText,
        description
      ]),
    );
  }
}
