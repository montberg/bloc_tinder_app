import 'package:bloc_tinder_app/styles.dart';
import 'package:flutter/material.dart';

class BulletListText extends StatelessWidget {
  final List<String> texts;
  const BulletListText({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: [...texts.map((e) => TextSpan(text: "  • $e\n", ))],
            style: Styles.bulletListTextStyle));
  }
}
