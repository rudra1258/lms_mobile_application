import 'package:flutter/material.dart';

class Chat_Screens extends StatefulWidget {
  const Chat_Screens({super.key});

  @override
  State<Chat_Screens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<Chat_Screens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Text('All Chats Appear here', style: TextStyle(color: Colors.black,fontSize: 23),),
      ),

    );
  }
}
