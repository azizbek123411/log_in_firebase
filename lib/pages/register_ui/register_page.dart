import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_firebase/services/authentication.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String errorMessage = '';
  bool isLogin = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  Widget _entireField(
    String title,
    TextEditingController controller,
  ) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none,
              hintText: title,
              hintStyle: const TextStyle(color: Colors.black54)),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == "" ? "" : 'Error ? $errorMessage',
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _submitButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(
          isLogin ? 'Log In' : "Register",
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget _logInButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(
          isLogin ? 'Register instead' : 'LogIn instead',
          style: const TextStyle(color: Colors.red, fontSize: 18),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              isLogin ? "Sign In" : 'Register',
              style: const TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            _entireField('Email', _emailController),
            _entireField('password', _passwordController),
            _errorMessage(),
            const SizedBox(
              height: 10,
            ),
            _submitButton(),
            _logInButton()
          ],
        ),
      ),
    );
  }
}
