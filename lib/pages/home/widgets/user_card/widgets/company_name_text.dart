import 'package:bloc_tinder_app/styles.dart';
import 'package:flutter/material.dart';

class CompanyNameText extends StatelessWidget {
  final String text;
  const CompanyNameText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Styles.companyTextStyle, maxLines: 1);
  }
}
