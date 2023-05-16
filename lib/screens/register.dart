import 'package:flutter/material.dart';
import 'package:piddle_two/screens/choose_quiz.dart';
import 'package:piddle_two/widgets/app_button.dart';
import 'package:piddle_two/widgets/app_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

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
          TextFormField(
            controller: confirmpassController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'CONFIRM PASSWORD',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(
                  color: piddlePurple,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          AppButton(
              label: 'REGISTER',
              onPressed: () async {
                if (passwordController.text == confirmpassController.text) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => ChooseQuizScreen()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                } else {
                  print('passwords do not match');
                }
              }

              // FirebaseAuth.instance.authStateChanges().listen((User? user) {
              //     if (user == null) {
              //       print('User is currently signed out!');
              //     } else {
              //       print('User is signed in!');
              //     }
              //   });
              )
        ],
      ),
    );
  }
}
