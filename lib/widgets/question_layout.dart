import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:piddle_two/theme.dart';
import 'package:piddle_two/widgets/app_button.dart';

class QuestionLayout extends StatefulWidget {
  final String question;
  final String answer;
  final String option2;
  final String option3;
  final String option4;
  final String selection = "";
  const QuestionLayout(
      {super.key,
      required this.question,
      required this.answer,
      required this.option2,
      required this.option3,
      required this.option4});

  @override
  State<QuestionLayout> createState() => _QuestionLayoutState();
}

class _QuestionLayoutState extends State<QuestionLayout> {
  List<String> options = [];
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    options.add(widget.answer);
    options.add(widget.option2);
    options.add(widget.option3);
    options.add(widget.option4);
    //print(options);
    options.shuffle();
    //print(options);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.question, textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.bodyLarge),
          const SizedBox(
            height: 75,
          ),
          AppButton.expanded(
              label: options[0],
              onPressed: () {
                _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }),
          AppButton.expanded(
              label: options[1],
              onPressed: () {
                _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }),
          AppButton.expanded(
              label: options[2],
              onPressed: () {
                _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }),
          AppButton.expanded(
              label: options[3],
              onPressed: () {
                _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }),
          // const SizedBox(
          //   height: 150,
          // ),
        ],
      ),
    );
  }
}
