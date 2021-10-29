import 'package:flutter/material.dart';

class ChatMessageItemView extends StatelessWidget {
  final String message;
  final String uid;
  final AnimationController animationController;

  const ChatMessageItemView(
      {Key? key,
      required this.message,
      required this.uid,
      required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: animationController,
        child: SizeTransition(
            sizeFactor: CurvedAnimation(
                parent: animationController, curve: Curves.easeOut),
            child: uid == '1' ? _myMessage() : _notMyMessage()));
  }

  _myMessage() {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(bottom: 1, left: 50, right: 5),
            child: Text(message),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10))));
  }

  _notMyMessage() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(bottom: 1, left: 5, right: 50),
            child: Text(message),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10))));
  }
}
