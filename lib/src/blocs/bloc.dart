import 'dart:async';
import 'validator.dart';

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
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();


  /*
    "get" let you referent stream and sink of streamController
    without it, you need to access stream and sink like "bloc.emailController.steam"
   */
  // Add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  /*
    dispose() -> call when object of class destroy  
   */
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}