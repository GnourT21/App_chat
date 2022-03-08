import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/pages/chat_page.dart';
import 'package:flash_chat/provider/auth.dart';
import 'package:flash_chat/provider/messenger_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AutheProvider>(
          create: (_) => AutheProvider(),
        ),
        ChangeNotifierProvider<MessengerProvider>(
          create: (_) => MessengerProvider(),
        ),
      ],
      builder: (context, widget) {
        return MaterialApp(
          title: 'Flash Chat',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: const Color(0xffF5F5F5),
          ),
          initialRoute: AuthScreen.route,
          routes: {
            ChatPage.route: (context) => const ChatPage(),
            AuthScreen.route: (context) => const AuthScreen(),
          },
        );
      },
    );
  }
}
