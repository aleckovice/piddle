import 'package:flutter/material.dart';
import 'package:piddle_two/screens/choose_quiz.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'EMAIL',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(
                  color: piddlePurple,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'PASSWORD',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(
                  color: piddlePurple,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          const SizedBox(height: 20),
          AppButton(
            label: 'LOGIN',
            onPressed: () async {
              try {
                final credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => ChooseQuizScreen()));
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            },
          )
        ],
      ),
    );
  }
}
