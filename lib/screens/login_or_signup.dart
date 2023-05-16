import 'package:flutter/material.dart';
import 'package:piddle_two/screens/login.dart';
import 'package:piddle_two/screens/register.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'package:piddle_two/widgets/app_screen.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          AppButton.expanded(
            label: 'LOG IN',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Login(),
                ),
              );
            },
          ),
          AppButton.expanded(
            label: 'SIGN UP',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Register(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}