import 'package:flutter/material.dart';
import "../Components/form.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FormProps props = FormProps(
    labels: [
      Label(
        label: "Email",
        type: LabelType.text,
      ),
      Label(
        label: "Password",
        type: LabelType.password,
      ),
    ],
    onSubmit: () => print("Submit"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(child: CustomForm(props: props)),
    );
  }
}
