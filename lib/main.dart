import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:piddle_two/screens/intro_screen.dart';
import 'firebase_options.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PIDDLE',
      theme: theme,
      home: const IntroScreen(),
    );
  }
}
