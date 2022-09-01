import 'package:chat_app/models/message.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
class Bubble extends StatelessWidget {
  const Bubble({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: BubbleSpecialOne(
        text: message.message,
        isSender: false,
        delivered: true,

        color: Colors.purple.shade100,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.purple,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
class Bubble2 extends StatelessWidget {
  const Bubble2({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: BubbleSpecialOne(
       delivered: true,
        text: message.message,
        isSender: true,

        color: Colors.green.shade100,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.purple,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}