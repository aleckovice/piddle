// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:piddle_two/theme.dart';

class QuizButton extends StatelessWidget {
  final String quizTitle;
  final String quizID;
  final String? quizDesc;
  final int? questionNo;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool expanded;

  const QuizButton.expanded({
    Key? key,
    required this.quizTitle,
    required this.quizID,
    this.onPressed,
    this.quizDesc,
    this.questionNo,
    this.backgroundColor,
  })  : expanded = true,
        super(key: key);

  const QuizButton({
    Key? key,
    required this.quizTitle,
    required this.quizID,
    this.onPressed,
    this.quizDesc,
    this.questionNo,
    this.backgroundColor,
  })  : expanded = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Row(
        children: [
          Expanded(
            child: _button(context),
          )
        ],
      );
    }
    return _button(context);
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 8.0,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            side: BorderSide(
              color: piddlePurple,
              width: 2,
            ),
            backgroundColor: backgroundColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Text(
              quizTitle.toUpperCase(),
              style: Theme.of(context).primaryTextTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
