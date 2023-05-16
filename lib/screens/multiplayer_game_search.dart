import 'package:flutter/material.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:piddle_two/widgets/heading.dart';
import 'package:piddle_two/widgets/app_input_field.dart';

class MultiplayerGameSearch extends StatelessWidget {
  MultiplayerGameSearch({Key? key}) : super(key: key);
  final _gameCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Heading(text: 'Enter game code'),
          AppInputField(controller: _gameCodeController),
          const SizedBox(height: 8.0),
          AppButton.expanded(
            label: 'Join game',
            onPressed: () async {
              
            },
          ),
        ],
      ),
    );
  }
}