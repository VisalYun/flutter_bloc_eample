import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(children: [
        emailField(),
        passwordField(),
        Container(
          margin: const EdgeInsets.only(top: 25.0),
        ),
        submitButton()
      ]),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.hasError ? '${snapshot.error}' : null),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration:
              InputDecoration(
                hintText: 'Password', 
                labelText: 'Password',
                errorText: snapshot.hasError ? '${snapshot.error}' : null),
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text("Login"),
      onPressed: () {},
    );
  }
}
