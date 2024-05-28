import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({super.key, required this.texto, required this.uid, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uid=='123'
            ? _myMessage()
            : _noMyMessage()
        ),
      ),
    );
  }


  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(
          bottom: 5,
          left: 40,
          right: 5
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget _noMyMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(
          bottom: 5,
          left: 5,
          right: 40
        ),
        child: Text(texto, style: const TextStyle(color: Colors.black87),),
      ),
    );
  }
}