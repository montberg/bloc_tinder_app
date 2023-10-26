import 'package:flutter/material.dart';

class Styles {
  static TextStyle usernameTextStyle = const TextStyle(
      fontSize: 50,
      wordSpacing: 1.3,
      height: 1.2,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis);

  static TextStyle companyTextStyle = TextStyle(
      fontSize: 35,
      color: Colors.black.withOpacity(0.7),
      overflow: TextOverflow.ellipsis);

  static TextStyle bulletListTextStyle =
      const TextStyle(fontSize: 26, overflow: TextOverflow.ellipsis, color: Colors.black, height: 2);
}
