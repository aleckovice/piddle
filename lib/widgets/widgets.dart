// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: const <TextSpan>[
        TextSpan(
            text: 'Piddle',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.deepPurple)),
      ],
    ),
  );
}
