import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'package:piddle_two/widgets/app_input_field.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:piddle_two/functions.dart';
import 'create_question.dart';

class CreateQuizTitle extends StatefulWidget {
  const CreateQuizTitle({super.key});

  @override
  State<CreateQuizTitle> createState() => _CreateQuizTitleState();
}

class _CreateQuizTitleState extends State<CreateQuizTitle> {
  final quizTitle = TextEditingController();
  final quizDesc = TextEditingController();
  final String quizID = generateRandomString(16);

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppInputField(
            controller: quizTitle,
            hintText: 'TITLE',
          ),
          AppInputField(
            controller: quizDesc,
            hintText: 'DESCRIPTION',
          ),
          AppButton.expanded(
            label: 'ADD QUESTIONS',
            onPressed: () async {
              Map<String, String> quizData = {
                "Quiz Title": quizTitle.text,
                'Quiz Description': quizDesc.text,
                "Quiz ID" : quizID
              };
              db.collection('Quiz').doc(quizID).set(quizData);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CreateQuestion(quizID)));
            },
          ),
        ],
      ),
    );
  }
}
