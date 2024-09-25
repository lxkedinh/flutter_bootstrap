import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/dialogs.dart';
import 'package:flutter_bootstrap/todo_list/todo_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 200.0, bottom: 40.0),
                child: Text("Log In",
                    style: Theme.of(context).textTheme.displayMedium)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                autofocus: true,
                controller: emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (email) {
                  if (email == null || email == "") {
                    return "No email entered";
                  }

                  bool isEmailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email);
                  if (!isEmailValid) {
                    return "Invalid email entered";
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (password) {
                  if (password == null || password == "") {
                    return "Please enter a password.";
                  }

                  return null;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);

                        showAlertDialog(
                            context, "Account successfully created!");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          showAlertDialog(
                              context, "Your password is too weak.");
                        } else if (e.code == "email-already-in-use") {
                          showAlertDialog(
                              context, "The email is already in use.");
                        }
                      }
                    }
                  },
                  child: const Text("Sign Up"),
                ),
                FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TodoListScreen()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            showAlertDialog(context,
                                "There is no account with that email.");
                          } else if (e.code == "wrong-password") {
                            showAlertDialog(
                                context, "Password is missing or incorrect.");
                          }
                        }
                      }
                    },
                    child: const Text("Log In")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
