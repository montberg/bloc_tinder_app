import 'package:bloc_tinder_app/styles.dart';
import 'package:flutter/material.dart';

class UsernameText extends StatelessWidget {
  final String text;
  const UsernameText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Styles.usernameTextStyle, maxLines: 4);
  }
}
