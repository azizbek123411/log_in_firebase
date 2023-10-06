import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_firebase/pages/home_ui/home_ui.dart';

import '../../services/authentication.dart';


class RegisterPage extends StatefulWidget {
  static const String id = 'register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthServices _auth=AuthServices();
  User? user;

  void _signUP() async{
    String email=emailController.text;
    String password=passwordController.text;
    User? user =await _auth.signUpWithEmailAndPassword(email, password);
    if(user!=null){
      print('user is successfully created');
      Navigator.pushReplacementNamed(context,HomePage.id);
    }else{
      print('Error');
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      hintText: 'Enter your email adress',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter you password",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              ElevatedButton(
                onPressed: _signUP,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
