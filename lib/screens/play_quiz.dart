import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:piddle_two/widgets/question_layout.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key, required this.quizID});
  final String quizID;
  

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  //PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(top: 100),
      child: StreamBuilder(
        stream: db
            .collection('Quiz')
            .doc(widget.quizID)
            .collection('Questions')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              //controller: _controller,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return QuestionLayout(
                    question: snapshot.data!.docs[index]["Question"],
                    answer: snapshot.data!.docs[index]["Answer"],
                    option2: snapshot.data!.docs[index]["Option2"],
                    option3: snapshot.data!.docs[index]["Option3"],
                    option4: snapshot.data!.docs[index]["Option4"]);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ));
  }
}
