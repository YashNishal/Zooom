import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zooom/resources/auth_methods.dart';
import 'package:zooom/screens/home_screen.dart';
import 'package:zooom/screens/video_call_screen.dart';
import 'package:zooom/utils/Colors.dart';
import 'package:zooom/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zooom',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: AuthMethods().authChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasData) {
            return const HomeScreen();
          }

          return const LoginScreen();
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call' : (context) => const VideoCallScreen()
      },
    );
  }
}
