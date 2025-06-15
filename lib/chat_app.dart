import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData.dark(),
      initialRoute: 'login',
      routes: {
        'login': (context) =>  LoginScreen(),
        'register': (context) =>  RegisterScreen(),
        'chat': (context) =>  ChatScreen(),
      },
    );
  }
}
