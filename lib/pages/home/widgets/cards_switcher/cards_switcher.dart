import 'package:flutter/material.dart';

class CardsSwitcher extends StatelessWidget {
  final VoidCallback goForwardAction;
  final VoidCallback goBackwardAction;

  const CardsSwitcher(
      {super.key,
      required this.goForwardAction,
      required this.goBackwardAction});

  final Icon _goForwardIcon = const Icon(Icons.arrow_forward);
  final Icon _goBackwardIcon = const Icon(Icons.arrow_back);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: goBackwardAction, icon: _goBackwardIcon),
          IconButton(onPressed: goForwardAction, icon: _goForwardIcon),
        ],
      ),
    );
  }
}
