import 'package:flutter/material.dart';

class Styles {
  static TextStyle usernameTextStyle = const TextStyle(
      fontSize: 30,
      wordSpacing: 1.3,
      height: 1.2,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis);

  static TextStyle companyTextStyle = TextStyle(
      fontSize: 25,
      color: Colors.black.withOpacity(0.7),
      overflow: TextOverflow.ellipsis);

  static TextStyle bulletListTextStyle =
      const TextStyle(fontSize: 23, overflow: TextOverflow.ellipsis, color: Colors.black);
}
