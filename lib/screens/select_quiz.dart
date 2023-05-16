import 'package:flutter/material.dart';
import 'package:piddle_two/screens/play_quiz.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:piddle_two/widgets/quiz_button.dart';

class SelectQuiz extends StatefulWidget {
  const SelectQuiz({super.key});

  @override
  State<SelectQuiz> createState() => _SelectQuizState();
}

class _SelectQuizState extends State<SelectQuiz> {
  final ref = FirebaseFirestore.instance.collection("Quiz");
  Stream? quizStream;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'QUIZZES',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return QuizButton.expanded(
                            quizTitle: snapshot.data!.docs[index]["Quiz Title"],
                            quizID: snapshot.data!.docs[index]["Quiz ID"],
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PlayQuiz(
                                            quizID: snapshot.data!.docs[index]
                                                ["Quiz ID"],
                                          )));
                            },
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
