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
            margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
            child: Text(message, style: const TextStyle(color: Colors.white)),
            decoration: BoxDecoration(
                color: const Color(0xff4D9EF6),
                borderRadius: BorderRadius.circular(20))));
  }

   _notMyMessage() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
            child: Text(message, style: const TextStyle(color: Colors.black87)),
            decoration: BoxDecoration(
                color: const Color(0xffE4E5E8),
                borderRadius: BorderRadius.circular(20))));
  }
}
