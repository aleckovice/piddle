// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:piddle_two/screens/login_or_signup.dart';
import 'package:piddle_two/screens/multiplayer_game_search.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import '../widgets/app_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'PIDDLE',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'SELECT ONE:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          AppButton.expanded(
            label: 'STUDENT',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MultiplayerGameSearch(),
                ),
              );
            },
          ),
          AppButton.expanded(
            label: 'TEACHER',
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginOrSignup(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}