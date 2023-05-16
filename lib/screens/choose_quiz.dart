import 'package:flutter/material.dart';
import 'package:piddle_two/screens/create_quiz_title.dart';
import 'package:piddle_two/screens/select_quiz.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:piddle_two/widgets/app_button.dart';

class ChooseQuizScreen extends StatefulWidget {
  const ChooseQuizScreen({super.key});

  @override
  State<ChooseQuizScreen> createState() => _ChooseQuizScreenState();
}

class _ChooseQuizScreenState extends State<ChooseQuizScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton.expanded(
            label: 'CREATE QUIZ',
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CreateQuizTitle()));
            },
          ),
          AppButton.expanded(
            label: 'HOST QUIZ',
            onPressed: () async {
              print(user?.email);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SelectQuiz()));
            },
          ),
        ],
      ),
    );
  }
}
