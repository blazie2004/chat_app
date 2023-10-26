import 'package:chat_app/screens/authscreen.dart';
import 'package:chat_app/screens/chatscreen.dart';
import 'package:chat_app/screens/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDkrRMmIxR_yKUGqLkmW73rFVvbdZnJk44",
          appId: "1:538233721056:android:95639f93edf549d4998085",
          messagingSenderId: "538233721056",
          projectId: "flutterchatapp-2b240",
          storageBucket: "flutterchatapp-2b240.appspot.com"));
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterChat',
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 17, 177)),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SplashScreen();
              }
              if (snapshot.hasData) {
                return Chatscreen();
              } else {
                return AuthScreen();
              }
            }));
  }
}
