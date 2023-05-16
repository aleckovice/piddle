// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piddle_two/theme.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final List<TextInputFormatter> inputFormatters;

  factory AppInputField.number({
    Key? key,
    required TextEditingController controller,
  }) {
    return AppInputField(
      key: key,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      textDirection: TextDirection.rtl,
    );
  }

  const AppInputField({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.inputFormatters = const [],
    this.textDirection,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyboardType,
        textDirection: textDirection,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: piddlePurple,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
