import 'package:bloc_tinder_app/pages/home/widgets/cards_switcher/cards_switcher.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/user_card.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/company_name_text.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/bullet_list_text.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/profile_photo.dart';
import 'package:bloc_tinder_app/pages/home/widgets/user_card/widgets/user_name_text.dart';
import 'package:flutter/material.dart';

CompanyNameText companyNameText =
    const CompanyNameText(text: "Company name very long veeeery long too much");
ProfilePhoto profilePhoto =
    const ProfilePhoto(photoUrl: "https://via.placeholder.com/600/771796");

UsernameText usernameText =
    const UsernameText(text: "This is username, it can be long and its okay");
var texts = [
  "text1sdfsdfsdfsdfs",
  "text2fsdfdsfdfsfsd",
  "text3",
  "text4fdsfsdfsdfdsfsd",
    "text1sdfsdfsdfsdfs",
  "text2fsdfdsfdfsfsd",
  "text3",
  "text4fdsfsdfsdfdsfsd",
    "text1sdfsdfsdfsdfs",
  "text2fsdfdsfdfsfsd",
  "text3",
  "text4fdsfsdfsdfdsfsd",
    "text1sdfsdfsdfsdfs",
  "text2fsdfdsfdfsfsd",
  "text3",
  "text4fdsfsdfsdfdsfsd",
    "text1sdfsdfsdfsdfs",
  "text2fsdfdsfdfsfsd",
  "text3",
  "text4fdsfsdfsdfdsfsd",

];

BulletListText bulletListText = BulletListText(texts: texts);
UserCard userCard = UserCard(profilePhoto: profilePhoto, usernameText: usernameText, companyNameText: companyNameText, description: bulletListText);




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: userCard, flex: 12,),
            Expanded(flex: 1,child: CardsSwitcher(goForwardAction: (){}, goBackwardAction: (){}))
          ],
        ),
      ),
    );
  }
}
