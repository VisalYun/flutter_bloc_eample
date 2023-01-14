import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

/*
  "with" keyword extends the capabilities of base class
  
  class Bloc extends Object with Validators --> Validators -> Object -> Bloc
 */

class Bloc extends Object with Validators {

  /*
    final emailController --> Public class variable
    final _emailController --> Private class variable
    --> _(underscore) in front of variable name make variable to private
   */
  /*
    SteamController doesn't have the ability to capture the latest updated value, so use BehaviorSubject which have that ability
   */
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  /*
    "get" let you referent stream and sink of streamController
    without it, you need to access stream and sink like "bloc.emailController.steam"
   */
  // Add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }


  /*
    dispose() -> call when object of class destroy  
   */
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}