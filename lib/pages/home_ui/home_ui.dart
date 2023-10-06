import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_firebase/pages/register_ui/register_page.dart';

class HomePage extends StatefulWidget {
  static const String id='home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Center(
            child: Text(
              'Successesfully registrated!!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: (){
           FirebaseAuth.instance.signOut();
           Navigator.pushReplacementNamed(context,RegisterPage.id);
          }, child:const Text('Log Out'),),
        ],
      ),
    );
  }
}
