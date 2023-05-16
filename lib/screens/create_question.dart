import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:piddle_two/widgets/app_input_field.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'select_quiz.dart';

class CreateQuestion extends StatefulWidget {
  const CreateQuestion(this.quizID, {super.key});
  final String quizID;

  @override
  State<CreateQuestion> createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  final a1controller = TextEditingController();
  final a2controller = TextEditingController();
  final a3controller = TextEditingController();
  final a4controller = TextEditingController();
  final questioncontroller = TextEditingController();

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppInputField(
          controller: questioncontroller,
          hintText: 'QUESTION:',
        ),
        const SizedBox(
          height: 20,
        ),
        AppInputField(
          controller: a1controller,
          hintText: 'CORRECT ANSWER',
        ),
        AppInputField(
          controller: a2controller,
          hintText: 'OPTION 2',
        ),
        AppInputField(
          controller: a3controller,
          hintText: 'OPTION 3',
        ),
        AppInputField(
          controller: a4controller,
          hintText: 'OPTION 4',
        ),
        const SizedBox(
          height: 80,
        ),
        AppButton.expanded(
          label: 'NEXT QUESTION',
          onPressed: () async {
            Map<String, String> questionData = {
              "Question": questioncontroller.text,
              "Answer": a1controller.text,
              "Option2": a2controller.text,
              "Option3": a3controller.text,
              "Option4": a4controller.text
            };

            db
                .collection("Quiz")
                .doc(widget.quizID)
                .collection("Questions")
                .add(questionData);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CreateQuestion(widget.quizID)));
          },
        ),
        AppButton.expanded(
          label: 'FINISH QUIZ',
          onPressed: () async {
            Map<String, String> questionData = {
              "Question": questioncontroller.text,
              "Answer": a1controller.text,
              "Option2": a2controller.text,
              "Option3": a3controller.text,
              "Option4": a4controller.text
            };

            db
                .collection("Quiz")
                .doc(widget.quizID)
                .collection("Questions")
                .add(questionData);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>  const SelectQuiz()));
          },
        ),
      ],
    ));
  }
}
