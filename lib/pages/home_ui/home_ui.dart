import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_firebase/services/authentication.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userID() {
    return Text(
      user?.email ?? 'User email',
      style: const TextStyle(color: Colors.white, fontSize: 30),
    );
  }

  Widget _signOutButton() {
    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: signOut,
        child: const Text(
          'Log out',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _userID(),
                const SizedBox(
                  height: 20,
                ),
                _signOutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
