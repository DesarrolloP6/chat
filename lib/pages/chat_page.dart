import 'package:chat/witgets/chat_message.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _txtController = TextEditingController();
  final _focusNode  = FocusNode();


  List<ChatMessage> _messages=[

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              maxRadius: 14,
              child:  Text('Te', style: TextStyle(fontSize: 12, color: Colors.white),),
            ),
            SizedBox(
              height: 3,
            ),
            Text('Marcos', style: TextStyle(fontSize: 12),)
          ]
          ,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
             Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index];
                },
                reverse: true,
              ),
            ),
            const Divider(),
            //TODO caja de texto
            Container(
              color: Colors.white,
              height: 40,
              child: _inputChat(),
            ),
            const Divider(),
          ],

        ),
      ),
     );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _txtController,
                focusNode: _focusNode,
                onSubmitted: _handeSummit,
                onChanged: (value) {
                  //TODO cuando hay un valor, par apoder postear
                },
                decoration: const InputDecoration.collapsed(hintText: 'Escribe aqu[i]'),
              )
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                onPressed: () => _handeSummit(_txtController.text), 
                icon: Icon(Icons.send, color: Colors.blue[400],)
              ),
            )
          ],
        ),
      )
    );
  }

  _handeSummit(String texto){
    String txt = texto.trim();

    if(txt.isEmpty) return;

    final newMsg = ChatMessage(
      texto: texto, 
      uid: '123',
      animationController: AnimationController(vsync: this,duration: Duration(milliseconds: 200)),
    );

    _messages.insert(0, newMsg);
    newMsg.animationController.forward();

    print(txt);
    _txtController.clear();
    _focusNode.requestFocus();

    setState(() {
      
    });
  }
  @override
  void dispose() {
    // TODO: off del socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}